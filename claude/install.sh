#!/usr/bin/env bash
#
# Installiert die Implisense-Skills für Claude Code nach ~/.claude/skills/<name>/SKILL.md
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/implisense/skills/main/claude/install.sh | bash
#
# Oder lokal nach dem Clonen:
#   ./claude/install.sh
#
# Die Skills liegen in plugin/skills/ — dieselben, die das ChatGPT-Plugin
# mitbringt. Sie setzen den Implisense-MCP-Server voraus (siehe SETUP_MCP.md).

set -euo pipefail

REPO_RAW_BASE="https://raw.githubusercontent.com/implisense/skills/main/plugin/skills"
TARGET_DIR="${HOME}/.claude/skills"
SKILLS=(
  "company-researcher"
  "portfolio-analyst"
  "lead-qualifier"
  "contact-finder"
)

# Verzeichnis dieses Skripts (lokaler Checkout: <repo>/claude/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || true)"
LOCAL_SKILLS="${SCRIPT_DIR:+${SCRIPT_DIR}/../plugin/skills}"

for skill in "${SKILLS[@]}"; do
  mkdir -p "${TARGET_DIR}/${skill}"
  if [ -n "${LOCAL_SKILLS}" ] && [ -f "${LOCAL_SKILLS}/${skill}/SKILL.md" ]; then
    cp "${LOCAL_SKILLS}/${skill}/SKILL.md" "${TARGET_DIR}/${skill}/SKILL.md"
    echo "  -> ${skill} (lokal)"
  else
    curl -fsSL "${REPO_RAW_BASE}/${skill}/SKILL.md" -o "${TARGET_DIR}/${skill}/SKILL.md"
    echo "  -> ${skill}"
  fi
done

echo ""
echo "Fertig. Skills installiert in ${TARGET_DIR}:"
for skill in "${SKILLS[@]}"; do echo "  ${TARGET_DIR}/${skill}/SKILL.md"; done
echo ""
echo "Nächster Schritt: Implisense-MCP-Server verbinden, siehe"
echo "  https://github.com/implisense/skills/blob/main/claude/SETUP_MCP.md"
