# CLAUDE.md

Arbeitsgrundlage für Claude und Mitwirkende in diesem Repository.

## Projekt

`implisense/skills` — sofort nutzbare Skills für KI-Assistenten (Claude, ChatGPT) rund um deutsche Unternehmensdaten, basierend auf der Implisense-Datenbank (2,3 Mio. deutsche Unternehmen: Handelsregister, Finanzkennzahlen, Management, Branchen).

Zwei Wege hinein:

- **Kostenlos ausprobieren** mit den mitgelieferten Beispieldaten (~30 bekannte deutsche Firmen) — kein Account, kein API-Key nötig.
- **Live-Daten** über den eigenen Implisense-API-Key bzw. MCP-Server — Zugriff auf alle 2,3 Mio. Firmen.

## Zielgruppe & Grundprinzip

Primär **KI-affin, aber kein Terminal nötig** (claude.ai-/ChatGPT-Nutzer, nicht zwingend Claude Code). Das Repo deckt zwei Assistenten mit je zwei Nutzungsmodi ab:

- **Claude** (`claude/`): claude.ai Project Instructions (copy-paste, Beispieldaten) + Claude Code mit MCP-Zugriff (installiert die Live-Skills aus `plugin/skills/`).
- **ChatGPT** (`chatgpt/`): Custom-GPT-Instructions, nutzbar als Free-Chat (Text einfügen + Datei anhängen) oder als Custom GPT (Plus: Instructions + Knowledge). Live-Daten über das ChatGPT-Plugin (`plugin/`).

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
│   ├── install.sh            ← One-liner: plugin/skills/<name>/ nach ~/.claude/skills/<name>/SKILL.md
│   └── projects/             ← claude.ai Project Instructions (copy-paste)
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
├── plugin/                   ← Live-Skills (MCP) + ChatGPT-Plugin-Paket
│   ├── .codex-plugin/plugin.json ← Manifest fürs ChatGPT-Plugin-Verzeichnis
│   ├── .mcp.json             ← https://mcp.implisense.com/
│   ├── assets/               ← logo.png (256×256), composer-icon.svg
│   └── skills/<name>/SKILL.md ← company-researcher, portfolio-analyst, lead-qualifier, contact-finder
│
├── scripts/
│   └── check-company-count.mjs  ← pinnt die Firmenzahl (2,3 Mio.) im ganzen Repo
│
└── sample-data/              ← shared, beide Plattformen laden hoch
    ├── companies.json        ← ~30 kuratierte deutsche Firmen (echte, öffentliche Daten)
    └── portfolio-beispiel.json
```

## Konventionen

- **Sprache:** Skills und README zweisprachig denken (DE primär, da Zielmarkt Deutschland — aber Code-/Dateinamen, Variablen, technische Begriffe Englisch). Einzelne Skill-Dateien können DE-only sein, wenn der Zielnutzer (deutsche Analysten/Consultants) das nahelegt — im Zweifel DE.
- **Sample-Daten:** Nur öffentlich bekannte, real existierende Unternehmen mit unkritischen Eckdaten (Name, Branche, Größe, Standort, grobe Finanzkennzahlen aus Handelsregister-Pflichtveröffentlichungen). Keine sensiblen oder nicht-öffentlichen Informationen.
- **Copy-paste-Skills (`claude/projects/`, `chatgpt/custom-gpt/`)** verweisen NICHT auf MCP-Tools — sie funktionieren ausschließlich mit der hochgeladenen `sample-data/`-Datei. Jeder endet mit demselben Hinweis, wie man mit einem API-Key auf alle Firmen zugreift (plattformneutral formuliert).
- **Live-Skills (`plugin/skills/<name>/SKILL.md`)** sind die eine Quelle für Claude Code (`claude/install.sh`) und das ChatGPT-Plugin. Sie setzen den MCP-Server voraus und haben keinen Demo-Modus — wer ohne Key ausprobieren will, nimmt die Copy-paste-Skills. Sie stützen sich nur auf Felder, die die Tools wirklich liefern, und enthalten keine Produktwerbung (die Verzeichnis-Prüfung lehnt das ab). Englisch, Antwort in der Sprache des Nutzers. Das Verzeichnisformat `<name>/SKILL.md` ist Pflicht — Claude Code lädt keine flachen `.md`-Dateien aus `~/.claude/skills/`.
- **Skill-Inhalte über Plattformen synchron halten:** Workflow/Scope/Einschränkungen je Skill sind in `claude/projects/` und `chatgpt/custom-gpt/` inhaltlich identisch — nur das Daten-Upload-Wording (Project vs. Knowledge/Chat) und die CTA-Schlusszeile unterscheiden sich. Änderung an einem Skill → in beiden Dateien nachziehen.
- **Firmenzahl:** Genau eine Zahl, überall — **2,3 Mio. / 2.3M** deutsche Unternehmen (Registertypen HRA, HRB, GnR, PR, aktiv; Vereine zählen nicht). Definiert im Wiki unter `knowledge-base/produkte/firmendatenbank.md`. `node scripts/check-company-count.mjs` erzwingt sie: keine retirierte Zahl (2,5 / 2,9) darf im Repo überleben, und die vier Einstiegsseiten müssen sie nennen. Dieselbe Prüfung liegt in `website` und `implisense-app` — ändert sich die Zahl, wandern `COUNT` und `RETIRED` in allen drei Skripten im selben Commit mit.
- **Skills:** `company-researcher` → `portfolio-analyst` → `lead-qualifier` (alle Wege) und `contact-finder` (nur live — die Beispieldaten enthalten keine Kontakte).
- **Scope:** Die Skills demonstrieren, was mit den Daten möglich ist. Sie sind bewusst keine vollständigen Produktions-Systeme (kein umfassender Scoring-Algorithmus, kein automatisiertes Monitoring) — dafür gibt es die Implisense-Produkte und -Services.

## MCP-Referenz

Implisense MCP-Server: `https://mcp.implisense.com/` (FastMCP). Anmeldung per OAuth — der Nutzer gibt seinen API-Key auf der Implisense-Seite „API-Zugang verbinden“ ein; alternativ Bearer-Header. Semantische Tools (nicht 1:1 REST): `company_profile`, `search_companies`, `similar_companies`, `recent_changes`, `person_network`, `portfolio_risk`, `find_contacts` + `get_contact_results` (Echtzeit-Kontaktsuche, 3 Implicents, asynchron), `account_status`, `ping`.

- Setup: siehe [`claude/SETUP_MCP.md`](claude/SETUP_MCP.md)
- API-Referenz: [api.implisense.com/v2/docs](https://api.implisense.com/v2/docs)
- API-Key & mehr: [implisense.com](https://www.implisense.com)

## Beiträge

Verbesserungen an Skills, Beispieldaten oder Doku sind willkommen — gern per Pull Request. Bitte die Plattform-Synchronität beachten (siehe Konventionen): eine Copy-paste-Skill-Änderung immer in der Claude- **und** der ChatGPT-Variante nachziehen; ändert sich der Workflow eines Skills, auch die Live-Fassung in `plugin/skills/` prüfen.

## Plugin (`plugin/`)

Paket für das ChatGPT-Plugin-Verzeichnis (eingereicht über platform.openai.com/plugins als ZIP). Dieselben Skills installiert `claude/install.sh` für Claude Code; ein Claude-Plugin (`.claude-plugin/plugin.json` neben dem Codex-Manifest) kann später auf denselben Ordner zeigen. Das ZIP wird aus dem Inhalt von `plugin/` gebaut (Manifest im ZIP-Root, nicht in einem Unterordner): `cd plugin && zip -r ../implisense-plugin.zip . -x '.DS_Store'`. Das ZIP ist gitignored.
