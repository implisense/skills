# CLAUDE.md

Diese Datei ist die Arbeitsgrundlage für Claude (und Mitwirkende) in diesem Repository.

## Projekt

`implisense/claude-skills` — ein öffentliches GitHub-Repo mit Claude-"Skills" rund um die Implisense-Firmendaten (2,5 Mio. deutsche Unternehmen). Zwei Ziele:

1. **Lead-Generierung:** KI-affine Interessenten (Analysten, Consultants, Developer) erleben Analytik-Qualität anhand von Beispieldaten und werden auf API/MCP-Abo aufmerksam.
2. **Glaubwürdigkeit:** Implisense als aktiver Player im KI/Agent-Ökosystem.

Konzept-Quelle (Entscheidungsgrundlage, nicht duplizieren): `~/claude/the-company/produkte/api+mcp+cli+skills/Plan-claude-skills-Repository.md`.

## Zielgruppe & Grundprinzip

Primär **KI-affin, aber kein Terminal** (claude.ai-/ChatGPT-Nutzer, nicht zwingend Claude Code). Repo deckt zwei Assistenten ab (Plattform-Achse) mit je zwei Nutzungsmodi:

- **Claude** (`claude/`): claude.ai Project Instructions (copy-paste) + Claude Code Skill mit MCP-Zugriff.
- **ChatGPT** (`chatgpt/`): Custom-GPT-Instructions, nutzbar als Free-Chat (Text einfügen + Datei anhängen) oder als Custom GPT (Plus, Instructions + Knowledge).

Zielnutzer ChatGPT-Seite: **Normalos/Endkunden**, kein Dev-Fokus. Daher kein OpenAPI-Actions-Pfad als Default (nur als CTA-Ausblick erwähnt, später nachrüstbar als `chatgpt/actions/`).

Bewusst kein geteilter `recipes/`-Quelllayer: bei 3 Skills × 2 Plattformen ist Prompt-Text pro Plattform leicht verschieden; Duplikat-Pflege < Abstraktions-Komplexität.

## Verzeichnisstruktur

```
.
├── CLAUDE.md                 ← diese Datei
├── README.md                 ← Einstieg: "Claude oder ChatGPT?"
│
├── claude/
│   ├── README.md             ← claude.ai vs Claude Code
│   ├── SETUP_MCP.md          ← MCP-Setup für Claude-Code-Pfad
│   ├── install.sh            ← One-liner: claude/skills/ nach ~/.claude/skills/ kopieren
│   ├── projects/             ← claude.ai Project Instructions (copy-paste)
│   │   ├── company-researcher.md
│   │   ├── portfolio-analyst.md
│   │   └── lead-qualifier.md
│   └── skills/               ← Claude Code Skills (mit MCP-Daten-Check)
│       ├── company-researcher.md
│       ├── portfolio-analyst.md
│       └── lead-qualifier.md
│
├── chatgpt/
│   ├── README.md             ← 2 Wege: Free-Chat vs Custom GPT (Plus)
│   └── custom-gpt/           ← Instructions-Text je Skill
│       ├── company-researcher.md
│       ├── portfolio-analyst.md
│       └── lead-qualifier.md
│
└── sample-data/              ← shared, beide Plattformen laden hoch
    ├── companies.json        ← ~30 kuratierte deutsche Firmen (echte, öffentliche Daten)
    └── portfolio-beispiel.json
```

## Konventionen

- **Sprache:** Skills und README zweisprachig denken (DE primär, da Zielmarkt Deutschland — aber Code-/Dateinamen, Variablen, technische Begriffe Englisch). Einzelne Skill-Dateien können DE-only sein, wenn der Zielnutzer (deutsche Analysten/Consultants) das nahelegt — im Zweifel DE.
- **Sample-Daten:** Nur öffentlich bekannte, real existierende Unternehmen mit unkritischen Eckdaten (Name, Branche, Größe, Standort, grobe Finanzkennzahlen aus Handelsregister-Pflichtveröffentlichungen). Keine sensiblen/nicht-öffentlichen Informationen.
- **Copy-paste-Skills (`claude/projects/`, `chatgpt/custom-gpt/`)** dürfen NICHT auf MCP-Tools verweisen — sie funktionieren ausschließlich mit der hochgeladenen `sample-data/`-Datei. Jeder endet mit demselben Conversion-CTA Richtung API/MCP (plattformneutral formuliert).
- **Claude-Code-Skills (`claude/skills/`)** prüfen zuerst, ob ein Implisense-MCP-Server verbunden ist (`company_profile`, `search_companies`, etc. verfügbar?) und nutzen dann echte Daten; ohne MCP fallen sie auf `sample-data/` zurück.
- **Skill-Inhalte über Plattformen synchron halten:** Workflow/Scope/Einschränkungen je Skill sind in `claude/projects/` und `chatgpt/custom-gpt/` inhaltlich identisch — nur Daten-Upload-Wording (Project vs. Knowledge/Chat) und CTA-Schlusszeile unterscheiden sich. Änderung an einem Skill → in beiden Dateien nachziehen.
- **MVP-Skills (Reihenfolge):** `company-researcher` → `portfolio-analyst` → `lead-qualifier`. Siehe Plan-Dokument für Scope jedes Skills.
- **Scope-Grenzen:** Kein vollständiger Scoring-Algorithmus, kein Monitoring-Automatismus (Signal Retainer), keine internen Segmentierungs-Heuristiken. Skills zeigen *was möglich ist*, nicht *wie Implisense es intern baut*.

## MCP-Referenz

Implisense MCP-Server: `https://mcp.implisense.com/` (FastMCP, Bearer-Token-Auth). Tools (semantisch, nicht 1:1 REST): `company_profile`, `search_companies`, `similar_companies`, `recent_changes`, `person_network`, `portfolio_risk`. Details: `~/claude/backend+api/CLAUDE.md` (MCP surface) und `~/claude/backend+api/spec/openapi-v2.json`.

## Status

Claude-Seite komplett (alle 3 Skills Format A+B, README, SETUP_MCP, install.sh).

ChatGPT-Seite ergänzt (Stand 2026-06-24): Repo auf Plattform-Achse umgestellt — bestehende Dateien nach `claude/` verschoben, `chatgpt/` mit Custom-GPT-Instructions je Skill + ChatGPT-README (Free-Chat- und Custom-GPT-Weg) neu. Root-README leitet auf "Claude oder ChatGPT?".

Offen:
- GitHub-Repo veröffentlichen (separater Schritt, nicht Teil dieses Arbeitsverzeichnisses).
- Optional/später: `chatgpt/actions/` (OpenAPI) für Dev-Zielgruppe, falls Nachfrage.
