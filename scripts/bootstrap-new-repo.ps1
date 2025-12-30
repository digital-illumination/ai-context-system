$ErrorActionPreference = "Stop"

# Bootstrap a new repo with the AI Context System.
# Assumes the context repo is available in .context (submodule).

if (-not (Test-Path ".context")) {
  Write-Error "Missing .context submodule. Add it first: git submodule add <git-url> .context"
  exit 1
}

# Copy canonical files into project root.
& .context/scripts/update-context.ps1

# Create updates folder and current/previous month files if needed.
if (-not (Test-Path "./updates")) { New-Item -ItemType Directory -Path "./updates" | Out-Null }

$CurrentMonth = Get-Date -Format "yyyy-MM"
$MonthFile = "updates/$CurrentMonth.md"

$MonthlyFiles = Get-ChildItem -Path "updates" -Filter "*.md" | Where-Object { $_.Name -ne "MONTHLY-UPDATES-TEMPLATE.md" }

if ($MonthlyFiles.Count -eq 0) {
  $PreviousMonth = (Get-Date).AddMonths(-1).ToString("yyyy-MM")
  Copy-Item "updates/MONTHLY-UPDATES-TEMPLATE.md" -Destination "updates/$PreviousMonth.md" -Force
  Copy-Item "updates/MONTHLY-UPDATES-TEMPLATE.md" -Destination $MonthFile -Force
  Write-Host "Seeded previous and current month files: $PreviousMonth.md, $CurrentMonth.md"
} else {
  if (-not (Test-Path $MonthFile)) {
    Copy-Item "updates/MONTHLY-UPDATES-TEMPLATE.md" -Destination $MonthFile -Force
  }
  Write-Host "Context bootstrap complete. Current month file: $MonthFile"
}
