$ErrorActionPreference = "Stop"

# Copy canonical context files from the submodule into the project root.
# Assumes this script is executed from the project root.

$ContextDir = ".context"
if (-not (Test-Path $ContextDir)) {
  Write-Error "Missing .context. Add the submodule first."
  exit 1
}

Copy-Item "$ContextDir/AI.md" -Destination "./AI.md" -Force
if (-not (Test-Path "./docs")) { New-Item -ItemType Directory -Path "./docs" | Out-Null }
Copy-Item "$ContextDir/docs/*" -Destination "./docs" -Recurse -Force
if (-not (Test-Path "./updates")) { New-Item -ItemType Directory -Path "./updates" | Out-Null }
Copy-Item "$ContextDir/updates/MONTHLY-UPDATES-TEMPLATE.md" -Destination "./updates/" -Force

Write-Host "Context files updated from $ContextDir."
