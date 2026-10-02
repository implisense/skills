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

### 🔌 Ich will Live-Daten (claude.ai, Claude-App oder Claude Code)

Voller Zugriff auf alle 2,3 Mio. Firmen über den Implisense-MCP-Server. Du brauchst ein kostenloses Implisense-Konto (100 Implicents Startguthaben) und einen API-Key — Schritt für Schritt in [`SETUP_MCP.md`](SETUP_MCP.md).

- **claude.ai / Claude-App:** Customize → Connectors → Add custom connector, URL `https://mcp.implisense.com/`, dann „Connect“ und API-Key eingeben.
- **Claude Code:** `claude mcp add --transport http implisense https://mcp.implisense.com/`, dann `/mcp` zum Anmelden. Die Skills installierst du mit:

```bash
curl -fsSL https://raw.githubusercontent.com/implisense/skills/main/claude/install.sh | bash
```

Das legt die Skills unter `~/.claude/skills/<name>/SKILL.md` an; Claude Code nutzt sie danach automatisch.

**Live-Skills ([`../plugin/skills/`](../plugin/skills/)):**

| Skill | Was er tut |
|---|---|
| `company-researcher` | Wie oben, mit Live-Daten: Management, Mehrjahres-Finanzen, Registeränderungen |
| `portfolio-analyst` | Risiko-Check einer Firmenliste über `portfolio_risk` |
| `lead-qualifier` | Zielfirmen zu einem Kundenprofil über `search_companies` und `similar_companies` |
| `contact-finder` | Ansprechpartner für eine Funktion (Vertrieb, Einkauf, IT, …) über die Echtzeit-Kontaktsuche, mit Quellen |

Ohne API-Key? Dann nimm die Copy-paste-Skills oben mit den Beispieldaten.
