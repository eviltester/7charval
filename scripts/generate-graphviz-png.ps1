Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$docsDir = Join-Path $repoRoot "docs"

if (-not (Test-Path -LiteralPath $docsDir -PathType Container)) {
    throw "Docs folder not found: $docsDir"
}

if (-not (Get-Command dot -ErrorAction SilentlyContinue)) {
    throw "Graphviz 'dot' command not found in PATH. Install Graphviz and ensure 'dot' is available."
}

$dotFiles = Get-ChildItem -LiteralPath $docsDir -Filter *.dot -File -Recurse

if ($dotFiles.Count -eq 0) {
    Write-Host "No .dot files found in $docsDir"
    exit 0
}

foreach ($dotFile in $dotFiles) {
    $outputFile = Join-Path $dotFile.DirectoryName ($dotFile.BaseName + ".png")
    Write-Host "Generating $($outputFile)..."
    & dot -Tpng -o $outputFile $dotFile.FullName
}

Write-Host "Generated $($dotFiles.Count) PNG file(s) under $docsDir"
