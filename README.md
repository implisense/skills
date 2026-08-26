# Implisense AI-Skills

Analyse-Skills für KI-Assistenten rund um deutsche Unternehmensdaten — basierend auf der Implisense-Datenbank mit **2,3 Millionen deutschen Unternehmen** (Handelsregister, Finanzkennzahlen, Management, Branchen).

Probier es in 2 Minuten aus, mit Beispieldaten von ~30 bekannten deutschen Firmen (SAP, BMW, Bosch, Miele, TRUMPF, dm, Trade Republic, …) — oder verbinde deinen eigenen Implisense-API-Key für beliebige Firmen.

---

## Welchen Assistenten nutzt du?

### 🟣 Claude → [`claude/`](claude/)

- **claude.ai im Browser:** Skill-Text in die Project Instructions kopieren, Beispieldaten hochladen, loslegen.
- **Claude Code im Terminal:** Skills per One-Liner installieren, optional den Implisense-MCP-Server für Live-Daten verbinden.

### 🟢 ChatGPT → [`chatgpt/`](chatgpt/)

- **ChatGPT Free:** Skill-Text in den Chat einfügen, Beispieldaten anhängen, loslegen.
- **ChatGPT Plus:** Skill als eigenes Custom GPT mit hinterlegten Daten einrichten.

Beide Wege nutzen dieselben Beispieldaten in [`sample-data/`](sample-data/) und zeigen dieselbe Analytik-Qualität.

---

## Verfügbare Skills

| Skill | Was er tut |
|---|---|
| `company-researcher` | Strukturiertes Firmenprofil: Stammdaten, Geschäftsmodell, Finanzkennzahlen, Einordnung |
| `portfolio-analyst` | Mehrere Firmen analysieren und nach Risiko/Gesundheit clustern |
| `lead-qualifier` | Liste potenzieller Kunden nach Relevanzkriterien bewerten |

Jeder Skill existiert für beide Assistenten — siehe das jeweilige Unterverzeichnis.

---

## Was ist Implisense?

Implisense ist ein Daten- und Analytik-Unternehmen, gegründet von Wissenschaftlern, das deutsche Unternehmen analysierbar macht: Analysen und Daten zu 2,3 Millionen deutschen Unternehmen — als Report, Produkt oder API/MCP.

→ [implisense.com](https://www.implisense.com)

## Lizenz & Daten

Die Beispieldaten in [`sample-data/`](sample-data/) enthalten ausschließlich öffentlich bekannte, real existierende Unternehmen mit unkritischen Eckdaten aus Handelsregister-Pflichtveröffentlichungen.
