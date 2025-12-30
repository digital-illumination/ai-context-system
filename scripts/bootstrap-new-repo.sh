#!/usr/bin/env bash
set -euo pipefail

# Bootstrap a new repo with the AI Context System.
# Assumes the context repo is available in .context (submodule).

if [ ! -d ".context" ]; then
  echo "Missing .context submodule. Add it first: git submodule add <git-url> .context" >&2
  exit 1
fi

# Copy canonical files into project root.
bash .context/scripts/update-context.sh

# Create updates folder and current/previous month files if needed.
mkdir -p updates

CURRENT_MONTH="$(date +%Y-%m)"
MONTH_FILE="updates/${CURRENT_MONTH}.md"

# If no monthly files exist (excluding the template), seed current + previous.
if ! ls updates/*.md >/dev/null 2>&1 || [ "$(ls updates/*.md | wc -l | tr -d ' ')" -le 1 ]; then
  PREVIOUS_MONTH="$(python3 - <<'PY'
import datetime
today = datetime.date.today()
first = today.replace(day=1)
prev_last = first - datetime.timedelta(days=1)
print(prev_last.strftime("%Y-%m"))
PY
)"
  cp updates/MONTHLY-UPDATES-TEMPLATE.md "updates/${PREVIOUS_MONTH}.md"
  cp updates/MONTHLY-UPDATES-TEMPLATE.md "$MONTH_FILE"
  echo "Seeded previous and current month files: ${PREVIOUS_MONTH}.md, ${CURRENT_MONTH}.md"
else
  if [ ! -f "$MONTH_FILE" ]; then
    cp updates/MONTHLY-UPDATES-TEMPLATE.md "$MONTH_FILE"
  fi
  echo "Context bootstrap complete. Current month file: $MONTH_FILE"
fi
