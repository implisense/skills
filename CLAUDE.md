# CLAUDE.md

Arbeitsgrundlage für Claude und Mitwirkende in diesem Repository.

## Projekt

`implisense/skills` — sofort nutzbare Skills für KI-Assistenten (Claude, ChatGPT) rund um deutsche Unternehmensdaten, basierend auf der Implisense-Datenbank (2,5 Mio. deutsche Unternehmen: Handelsregister, Finanzkennzahlen, Management, Branchen).

Zwei Wege hinein:

- **Kostenlos ausprobieren** mit den mitgelieferten Beispieldaten (~30 bekannte deutsche Firmen) — kein Account, kein API-Key nötig.
- **Live-Daten** über den eigenen Implisense-API-Key bzw. MCP-Server — Zugriff auf alle 2,5 Mio. Firmen.

## Zielgruppe & Grundprinzip

Primär **KI-affin, aber kein Terminal nötig** (claude.ai-/ChatGPT-Nutzer, nicht zwingend Claude Code). Das Repo deckt zwei Assistenten mit je zwei Nutzungsmodi ab:

- **Claude** (`claude/`): claude.ai Project Instructions (copy-paste) + Claude Code Skill mit MCP-Zugriff.
- **ChatGPT** (`chatgpt/`): Custom-GPT-Instructions, nutzbar als Free-Chat (Text einfügen + Datei anhängen) oder als Custom GPT (Plus: Instructions + Knowledge).

Auf der ChatGPT-Seite liegt der Fokus auf Nutzung ohne Entwickler-Setup; ein OpenAPI-Actions-Pfad ist bewusst nicht der Standardweg (später nachrüstbar als `chatgpt/actions/`).

Es gibt bewusst keinen geteilten `recipes/`-Quelllayer: Bei 3 Skills × 2 Plattformen unterscheidet sich der Prompt-Text pro Plattform leicht — Duplikat-Pflege ist einfacher als die Abstraktion.

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
- **Sample-Daten:** Nur öffentlich bekannte, real existierende Unternehmen mit unkritischen Eckdaten (Name, Branche, Größe, Standort, grobe Finanzkennzahlen aus Handelsregister-Pflichtveröffentlichungen). Keine sensiblen oder nicht-öffentlichen Informationen.
- **Copy-paste-Skills (`claude/projects/`, `chatgpt/custom-gpt/`)** verweisen NICHT auf MCP-Tools — sie funktionieren ausschließlich mit der hochgeladenen `sample-data/`-Datei. Jeder endet mit demselben Hinweis, wie man mit einem API-Key auf alle Firmen zugreift (plattformneutral formuliert).
- **Claude-Code-Skills (`claude/skills/`)** prüfen zuerst, ob ein Implisense-MCP-Server verbunden ist (`company_profile`, `search_companies`, etc. verfügbar?) und nutzen dann echte Daten; ohne MCP fallen sie auf `sample-data/` zurück.
- **Skill-Inhalte über Plattformen synchron halten:** Workflow/Scope/Einschränkungen je Skill sind in `claude/projects/` und `chatgpt/custom-gpt/` inhaltlich identisch — nur das Daten-Upload-Wording (Project vs. Knowledge/Chat) und die CTA-Schlusszeile unterscheiden sich. Änderung an einem Skill → in beiden Dateien nachziehen.
- **MVP-Skills (Reihenfolge):** `company-researcher` → `portfolio-analyst` → `lead-qualifier`.
- **Scope:** Die Skills demonstrieren, was mit den Daten möglich ist. Sie sind bewusst keine vollständigen Produktions-Systeme (kein umfassender Scoring-Algorithmus, kein automatisiertes Monitoring) — dafür gibt es die Implisense-Produkte und -Services.

## MCP-Referenz

Implisense MCP-Server: `https://mcp.implisense.com/` (FastMCP, Bearer-Token-Auth). Semantische Tools (nicht 1:1 REST): `company_profile`, `search_companies`, `similar_companies`, `recent_changes`, `person_network`, `portfolio_risk`.

- Setup: siehe [`claude/SETUP_MCP.md`](claude/SETUP_MCP.md)
- API-Referenz: [api.implisense.com/v2/docs](https://api.implisense.com/v2/docs)
- API-Key & mehr: [implisense.com](https://www.implisense.com)

## Beiträge

Verbesserungen an Skills, Beispieldaten oder Doku sind willkommen — gern per Pull Request. Bitte die Plattform-Synchronität beachten (siehe Konventionen): eine Skill-Änderung immer in der Claude- **und** der ChatGPT-Variante nachziehen.
