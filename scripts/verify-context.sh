#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "AI.md"
  "docs/BOOTSTRAP.md"
  "docs/PROJECT-CONTEXT.md"
  "docs/ARCHITECTURE.md"
  "docs/CODING-STANDARDS.md"
  "docs/DECISIONS.md"
  "updates/MONTHLY-UPDATES-TEMPLATE.md"
)

missing=0
for f in "${required_files[@]}"; do
  if [ ! -f "$f" ]; then
    echo "Missing: $f"
    missing=1
  fi
done

if [ $missing -ne 0 ]; then
  echo "Context verification failed."
  exit 1
fi

echo "Context verification passed."
