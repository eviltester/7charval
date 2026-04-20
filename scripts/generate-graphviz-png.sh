#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
docs_dir="$repo_root/docs"

if [[ ! -d "$docs_dir" ]]; then
  echo "Docs folder not found: $docs_dir" >&2
  exit 1
fi

if ! command -v dot >/dev/null 2>&1; then
  echo "Graphviz 'dot' command not found in PATH. Install Graphviz and ensure 'dot' is available." >&2
  exit 1
fi

count=0
while IFS= read -r -d '' dot_file; do
  output_file="${dot_file%.dot}.png"
  echo "Generating $output_file..."
  dot -Tpng -o "$output_file" "$dot_file"
  count=$((count + 1))
done < <(find "$docs_dir" -type f -name '*.dot' -print0)

if [[ "$count" -eq 0 ]]; then
  echo "No .dot files found in $docs_dir"
  exit 0
fi

echo "Generated $count PNG file(s) under $docs_dir"
