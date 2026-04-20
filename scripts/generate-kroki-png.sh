#!/usr/bin/env bash
set -euo pipefail

input_root="docs/examples"
kroki_base_url="https://kroki.io"

while [[ $# -gt 0 ]]; do
  case "$1" in
    -i|--input-root)
      input_root="$2"
      shift 2
      ;;
    -u|--kroki-base-url)
      kroki_base_url="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1" >&2
      echo "Usage: $0 [--input-root <path>] [--kroki-base-url <url>]" >&2
      exit 1
      ;;
  esac
done

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
source_root="$repo_root/$input_root"

if [[ ! -d "$source_root" ]]; then
  echo "Kroki source folder not found: $source_root" >&2
  exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "curl not found in PATH." >&2
  exit 1
fi

generated_count=0
skipped_count=0
failed_count=0

while IFS= read -r -d '' source_file; do
  extension=".${source_file##*.}"
  extension="$(printf '%s' "$extension" | tr '[:upper:]' '[:lower:]')"

  diagram_type=""
  output_format="png"

  case "$extension" in
    .dot) diagram_type="graphviz"; output_format="png" ;;
    .d2) diagram_type="d2"; output_format="svg" ;;
    .c4) diagram_type="c4plantuml"; output_format="png" ;;
    .mmd) diagram_type="mermaid"; output_format="png" ;;
    .dsl) diagram_type="structurizr"; output_format="png" ;;
    *) continue ;;
  esac

  # Kroki supports C4 via PlantUML C4, not LikeC4 DSL.
  if [[ "$extension" == ".c4" ]] && head -n 10 "$source_file" | grep -Eq '^[[:space:]]*specification[[:space:]]*\{'; then
    echo "WARNING: Skipping $source_file: LikeC4 DSL is not supported by Kroki c4plantuml." >&2
    skipped_count=$((skipped_count + 1))
    continue
  fi

  output_file="${source_file%.*}.${output_format}"
  endpoint="${kroki_base_url%/}/${diagram_type}/${output_format}"
  temp_output_file="$(mktemp)"

  echo "Generating $output_file via $diagram_type ($output_format)..."
  http_code="$(curl --silent --show-error \
    -X POST \
    -H "Content-Type: text/plain" \
    --data-binary "@$source_file" \
    "$endpoint" \
    --output "$temp_output_file" \
    --write-out "%{http_code}")"

  if [[ "$http_code" =~ ^[0-9]{3}$ ]] && (( http_code >= 400 )); then
    error_body="$(cat "$temp_output_file" || true)"
    rm -f "$temp_output_file"
    echo "WARNING: Failed ($http_code) for $source_file: $error_body" >&2
    failed_count=$((failed_count + 1))
    continue
  fi

  mv -f "$temp_output_file" "$output_file"
  generated_count=$((generated_count + 1))
done < <(find "$source_root" -type f \( -name '*.dot' -o -name '*.d2' -o -name '*.c4' -o -name '*.mmd' -o -name '*.dsl' \) -print0)

echo "Generated $generated_count image file(s) under $source_root ($skipped_count skipped, $failed_count failed)"
