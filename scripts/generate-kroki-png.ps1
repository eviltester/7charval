param(
    [string]$InputRoot = "docs/examples",
    [string]$KrokiBaseUrl = "https://kroki.io"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$sourceRoot = Join-Path $repoRoot $InputRoot

if (-not (Test-Path -LiteralPath $sourceRoot -PathType Container)) {
    throw "Kroki source folder not found: $sourceRoot"
}

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) {
    throw "curl.exe not found in PATH."
}

$renderConfigByExtension = @{
    ".dot" = @{ diagramType = "graphviz"; outputFormat = "png" }
    ".d2"  = @{ diagramType = "d2"; outputFormat = "svg" }
    ".c4"  = @{ diagramType = "c4plantuml"; outputFormat = "png" }
    ".mmd" = @{ diagramType = "mermaid"; outputFormat = "png" }
    ".dsl" = @{ diagramType = "structurizr"; outputFormat = "png" }
}

$patterns = $renderConfigByExtension.Keys | ForEach-Object { "*$_" }
$sourceFiles = Get-ChildItem -LiteralPath $sourceRoot -File -Recurse -Include $patterns

if ($sourceFiles.Count -eq 0) {
    Write-Host "No matching source files found under $sourceRoot"
    exit 0
}

$generatedCount = 0
$skippedCount = 0
$failedCount = 0

foreach ($sourceFile in $sourceFiles) {
    $extension = $sourceFile.Extension.ToLowerInvariant()
    $renderConfig = $renderConfigByExtension[$extension]
    if (-not $renderConfig) {
        continue
    }

    $diagramType = $renderConfig.diagramType
    $outputFormat = $renderConfig.outputFormat

    # Kroki supports C4 via PlantUML C4, not LikeC4 DSL.
    if ($extension -eq ".c4") {
        $fileHead = (Get-Content -LiteralPath $sourceFile.FullName -TotalCount 10) -join "`n"
        if ($fileHead -match "^\s*specification\s*\{") {
            Write-Warning "Skipping $($sourceFile.FullName): LikeC4 DSL is not supported by Kroki c4plantuml."
            $skippedCount++
            continue
        }
    }

    $outputFile = Join-Path $sourceFile.DirectoryName ($sourceFile.BaseName + ".$outputFormat")
    $endpoint = "$KrokiBaseUrl/$diagramType/$outputFormat"
    $tempOutputFile = [System.IO.Path]::GetTempFileName()

    Write-Host "Generating $($outputFile) via $diagramType ($outputFormat)..."
    $httpCode = & curl.exe --silent --show-error `
        -X POST `
        -H "Content-Type: text/plain" `
        --data-binary "@$($sourceFile.FullName)" `
        "$endpoint" `
        --output "$tempOutputFile" `
        --write-out "%{http_code}"

    if ($httpCode -match "^\d{3}$" -and [int]$httpCode -ge 400) {
        $errorBody = ""
        if (Test-Path -LiteralPath $tempOutputFile) {
            $errorBody = (Get-Content -LiteralPath $tempOutputFile -Raw)
            Remove-Item -LiteralPath $tempOutputFile -Force
        }
        Write-Warning "Failed ($httpCode) for $($sourceFile.FullName): $errorBody"
        $failedCount++
        continue
    }

    Move-Item -LiteralPath $tempOutputFile -Destination $outputFile -Force
    $generatedCount++
}

Write-Host "Generated $generatedCount image file(s) under $sourceRoot ($skippedCount skipped, $failedCount failed)"
