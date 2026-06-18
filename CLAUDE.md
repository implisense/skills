# CLAUDE.md

Diese Datei ist die Arbeitsgrundlage für Claude (und Mitwirkende) in diesem Repository.

## Projekt

`implisense/claude-skills` — ein öffentliches GitHub-Repo mit Claude-"Skills" rund um die Implisense-Firmendaten (2,5 Mio. deutsche Unternehmen). Zwei Ziele:

1. **Lead-Generierung:** KI-affine Interessenten (Analysten, Consultants, Developer) erleben Analytik-Qualität anhand von Beispieldaten und werden auf API/MCP-Abo aufmerksam.
2. **Glaubwürdigkeit:** Implisense als aktiver Player im KI/Agent-Ökosystem.

Konzept-Quelle (Entscheidungsgrundlage, nicht duplizieren): `~/claude/the-company/produkte/api+mcp+cli+skills/Plan-claude-skills-Repository.md`.

## Zielgruppe & Grundprinzip

Primär **KI-affin, aber kein Terminal** (claude.ai-Nutzer, nicht zwingend Claude Code). Daher **Dual-Format**: jeder Skill existiert zweimal — einmal als copy-paste-barer Project-Instructions-Text (Format A), einmal als Claude-Code-Skill mit echtem MCP-Zugriff (Format B).

## Verzeichnisstruktur

```
.
├── CLAUDE.md                 ← diese Datei
├── README.md                 ← Einstieg: "claude.ai oder Claude Code?"
├── SETUP_MCP.md              ← MCP-Setup für Claude-Code-Pfad
├── install.sh                ← One-liner: skills/ nach ~/.claude/skills/ kopieren
│
├── projects/                 ← Format A: claude.ai Project Instructions
│   ├── company-researcher.md
│   ├── portfolio-analyst.md
│   └── lead-qualifier.md
│
├── skills/                   ← Format B: Claude Code Skills (mit MCP-Daten-Check)
│   ├── company-researcher.md
│   ├── portfolio-analyst.md
│   └── lead-qualifier.md
│
└── sample-data/
    ├── companies.json        ← ~30 kuratierte deutsche Firmen (echte, öffentliche Daten)
    └── portfolio-beispiel.json
```

## Konventionen

- **Sprache:** Skills und README zweisprachig denken (DE primär, da Zielmarkt Deutschland — aber Code-/Dateinamen, Variablen, technische Begriffe Englisch). Einzelne Skill-Dateien können DE-only sein, wenn der Zielnutzer (deutsche Analysten/Consultants) das nahelegt — im Zweifel DE.
- **Sample-Daten:** Nur öffentlich bekannte, real existierende Unternehmen mit unkritischen Eckdaten (Name, Branche, Größe, Standort, grobe Finanzkennzahlen aus Handelsregister-Pflichtveröffentlichungen). Keine sensiblen/nicht-öffentlichen Informationen.
- **Format-A-Skills (`projects/`)** dürfen NICHT auf MCP-Tools verweisen — sie funktionieren ausschließlich mit der hochgeladenen `sample-data/`-Datei. Jeder Format-A-Skill endet mit einem klaren Conversion-CTA Richtung API/MCP.
- **Format-B-Skills (`skills/`)** prüfen zuerst, ob ein Implisense-MCP-Server verbunden ist (`company_profile`, `search_companies`, etc. verfügbar?) und nutzen dann echte Daten; ohne MCP fallen sie auf `sample-data/` zurück.
- **MVP-Skills (Reihenfolge):** `company-researcher` → `portfolio-analyst` → `lead-qualifier`. Siehe Plan-Dokument für Scope jedes Skills.
- **Scope-Grenzen:** Kein vollständiger Scoring-Algorithmus, kein Monitoring-Automatismus (Signal Retainer), keine internen Segmentierungs-Heuristiken. Skills zeigen *was möglich ist*, nicht *wie Implisense es intern baut*.

## MCP-Referenz

Implisense MCP-Server: `https://mcp.implisense.com/` (FastMCP, Bearer-Token-Auth). Tools (semantisch, nicht 1:1 REST): `company_profile`, `search_companies`, `similar_companies`, `recent_changes`, `person_network`, `portfolio_risk`. Details: `~/claude/backend+api/CLAUDE.md` (MCP surface) und `~/claude/backend+api/spec/openapi-v2.json`.

## Status

Aufbau läuft (Stand 2026-06-11), Reihenfolge gemäß Plan-Dokument Abschnitt "Umsetzungsschritte":
1. ✅ `sample-data/companies.json` — 29 kuratierte Firmen
2. ✅ `projects/company-researcher.md`
3. ✅ `skills/company-researcher.md`
4. ✅ `README.md`
5. ✅ `portfolio-analyst` (Format A+B) + `sample-data/portfolio-beispiel.json`
6. ✅ `lead-qualifier` (Format A+B)
7. ✅ `SETUP_MCP.md`
8. ✅ `install.sh`
9. GitHub-Repo veröffentlichen (separater Schritt, nicht Teil dieses Arbeitsverzeichnisses) — letzter offener Schritt
