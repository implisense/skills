# Implisense-Skills für Claude

Skills für Claude rund um deutsche Unternehmensdaten — basierend auf der Implisense-Datenbank mit **2,3 Millionen deutschen Unternehmen** (Handelsregister, Finanzkennzahlen, Management, Branchen).

Probier es in 2 Minuten aus, mit Beispieldaten von ~30 bekannten deutschen Firmen — oder verbinde deinen eigenen Implisense-API-Key für beliebige Firmen.

> Du nutzt ChatGPT statt Claude? Siehe [`../chatgpt/`](../chatgpt/).

---

## Wie nutzt du Claude?

### 🌐 Ich nutze claude.ai im Browser

Kein Terminal nötig, ~2 Minuten Setup (claude.ai Projects erfordert einen bezahlten Plan):

1. Öffne den Skill, den du ausprobieren willst, z. B. [`projects/company-researcher.md`](projects/company-researcher.md)
2. Kopiere den gesamten Inhalt (GitHub: "Copy raw file"-Button)
3. Gehe zu [claude.ai](https://claude.ai) → **New Project**
4. Füge den Inhalt in die **Project Instructions** ein
5. Lade im selben Projekt die Datei [`../sample-data/companies.json`](../sample-data/companies.json) hoch
6. Starte einen Chat: *"Analysiere die Siemens AG"* oder *"Was weißt du über CHECK24?"*

Du arbeitest mit Beispieldaten zu ~30 bekannten deutschen Unternehmen (SAP, BMW, Bosch, Miele, TRUMPF, dm, Trade Republic, …). Jede Analyse endet mit einem Hinweis, wie du mit einem API-Key Zugriff auf alle 2,3 Mio. Firmen bekommst.

**Verfügbare Skills (`projects/`):**

| Skill | Was er tut |
|---|---|
| [`company-researcher.md`](projects/company-researcher.md) | Strukturiertes Firmenprofil: Stammdaten, Geschäftsmodell, Finanzkennzahlen, Einordnung |
| [`portfolio-analyst.md`](projects/portfolio-analyst.md) | Mehrere Firmen analysieren und nach Risiko/Gesundheit clustern |
| [`lead-qualifier.md`](projects/lead-qualifier.md) | Liste potenzieller Kunden nach Relevanzkriterien bewerten |

---

### 💻 Ich nutze Claude Code im Terminal

Voller Zugriff auf alle 2,3 Mio. Firmen über die Implisense-MCP-API (Bearer-Token erforderlich, siehe [`SETUP_MCP.md`](SETUP_MCP.md)).

**Installation:**

```bash
curl -fsSL https://raw.githubusercontent.com/implisense/claude-skills/main/claude/install.sh | bash
```

Das kopiert den Inhalt von `claude/skills/` nach `~/.claude/skills/`. Claude Code nutzt die Skills danach automatisch.

**Verfügbare Skills (`skills/`):**

| Skill | Was er tut |
|---|---|
| [`company-researcher.md`](skills/company-researcher.md) | Wie oben, aber mit Live-Daten (falls MCP verbunden) und Demo-Fallback |
| [`portfolio-analyst.md`](skills/portfolio-analyst.md) | Portfolio-Analyse über `portfolio_risk`-Tool |
| [`lead-qualifier.md`](skills/lead-qualifier.md) | Lead-Bewertung über `search_companies` + `company_profile` |

Ohne MCP-Verbindung greifen diese Skills automatisch auf [`../sample-data/`](../sample-data/) zurück — du kannst sie also auch ohne API-Key ausprobieren.
