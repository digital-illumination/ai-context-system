$ErrorActionPreference = "Stop"

$RequiredFiles = @(
  "AI.md",
  "docs/BOOTSTRAP.md",
  "docs/PROJECT-CONTEXT.md",
  "docs/ARCHITECTURE.md",
  "docs/CODING-STANDARDS.md",
  "docs/DECISIONS.md",
  "updates/MONTHLY-UPDATES-TEMPLATE.md"
)

$Missing = @()
foreach ($f in $RequiredFiles) {
  if (-not (Test-Path $f)) {
    $Missing += $f
  }
}

if ($Missing.Count -gt 0) {
  Write-Host "Missing required files:" -ForegroundColor Red
  $Missing | ForEach-Object { Write-Host "- $_" }
  exit 1
}

Write-Host "Context verification passed." -ForegroundColor Green
