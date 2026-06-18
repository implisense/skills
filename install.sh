#!/usr/bin/env bash
#
# Installiert die Implisense Claude-Code-Skills nach ~/.claude/skills/
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/implisense/claude-skills/main/install.sh | bash
#
# Oder lokal nach dem Clonen:
#   ./install.sh

set -euo pipefail

REPO_RAW_BASE="https://raw.githubusercontent.com/implisense/claude-skills/main"
TARGET_DIR="${HOME}/.claude/skills"
SKILL_FILES=(
  "company-researcher.md"
  "portfolio-analyst.md"
  "lead-qualifier.md"
)

mkdir -p "${TARGET_DIR}"

if [ -d "./skills" ] && [ -f "./CLAUDE.md" ]; then
  # Lokaler Checkout: direkt kopieren
  echo "Lokales Repo erkannt — kopiere skills/ nach ${TARGET_DIR}"
  cp ./skills/*.md "${TARGET_DIR}/"
else
  # Remote-Installation via curl
  echo "Lade Skills von ${REPO_RAW_BASE}/skills/ ..."
  for file in "${SKILL_FILES[@]}"; do
    echo "  -> ${file}"
    curl -fsSL "${REPO_RAW_BASE}/skills/${file}" -o "${TARGET_DIR}/${file}"
  done
fi

echo ""
echo "Fertig. Skills installiert in ${TARGET_DIR}:"
ls -1 "${TARGET_DIR}"
echo ""
echo "Hinweis: Für Live-Daten zu 2,5 Mio. deutschen Unternehmen verbinde den"
echo "Implisense MCP-Server — siehe SETUP_MCP.md im Repo."
echo "Ohne MCP-Verbindung greifen die Skills automatisch auf sample-data/ zurück."
