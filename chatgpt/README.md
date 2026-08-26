# Implisense-Skills für ChatGPT

Dieselben Analyse-Skills wie auf der Claude-Seite, aufbereitet für ChatGPT — rund um die Implisense-Datenbank mit **2,3 Millionen deutschen Unternehmen** (Handelsregister, Finanzkennzahlen, Management, Branchen).

Probier es mit Beispieldaten von ~30 bekannten deutschen Firmen aus. Es gibt zwei Wege — wähle nach deinem ChatGPT-Plan:

> Du nutzt Claude statt ChatGPT? Siehe [`../claude/`](../claude/).

---

## 🟢 Weg 1: Direkt im Chat (funktioniert mit ChatGPT Free)

Kein Setup, ~2 Minuten:

1. Öffne den Skill, den du ausprobieren willst, z. B. [`custom-gpt/company-researcher.md`](custom-gpt/company-researcher.md)
2. Kopiere den gesamten Inhalt (GitHub: "Copy raw file"-Button)
3. Starte einen neuen Chat auf [chatgpt.com](https://chatgpt.com) und füge den Text als erste Nachricht ein
4. Hänge im selben Chat die Datei [`../sample-data/companies.json`](../sample-data/companies.json) an (Büroklammer-Symbol) — beim `portfolio-analyst` zusätzlich [`../sample-data/portfolio-beispiel.json`](../sample-data/portfolio-beispiel.json)
5. Frag los: *"Analysiere die Siemens AG"* oder *"Was weißt du über CHECK24?"*

---

## 🔵 Weg 2: Als Custom GPT (erfordert ChatGPT Plus/Team/Enterprise)

Einmal einrichten, dann dauerhaft als eigenes GPT nutzbar und teilbar:

1. Gehe zu [chatgpt.com](https://chatgpt.com) → **GPTs** → **Create** → Reiter **Configure**
2. Kopiere den Inhalt des gewünschten Skills (z. B. [`custom-gpt/company-researcher.md`](custom-gpt/company-researcher.md)) in das Feld **Instructions**
3. Lade unter **Knowledge** die Datei [`../sample-data/companies.json`](../sample-data/companies.json) hoch (beim `portfolio-analyst` zusätzlich [`../sample-data/portfolio-beispiel.json`](../sample-data/portfolio-beispiel.json))
4. Gib dem GPT einen Namen (z. B. "Implisense Company Researcher"), speichern
5. Frag los — das GPT greift automatisch auf die hinterlegten Daten zu

---

Du arbeitest mit Beispieldaten zu ~30 bekannten deutschen Unternehmen (SAP, BMW, Bosch, Miele, TRUMPF, dm, Trade Republic, …). Jede Analyse endet mit einem Hinweis, wie du mit einem API-Key Zugriff auf alle 2,3 Mio. Firmen bekommst.

**Verfügbare Skills (`custom-gpt/`):**

| Skill | Was er tut |
|---|---|
| [`company-researcher.md`](custom-gpt/company-researcher.md) | Strukturiertes Firmenprofil: Stammdaten, Geschäftsmodell, Finanzkennzahlen, Einordnung |
| [`portfolio-analyst.md`](custom-gpt/portfolio-analyst.md) | Mehrere Firmen analysieren und nach Risiko/Gesundheit clustern (benötigt beide Beispieldateien) |
| [`lead-qualifier.md`](custom-gpt/lead-qualifier.md) | Liste potenzieller Kunden nach Relevanzkriterien bewerten |

---

## Live-Daten statt Beispieldaten

Die Skills hier nutzen die hochgeladenen Beispieldaten (~30 Firmen). Für Zugriff auf alle **2,3 Millionen deutschen Unternehmen** mit Mehrjahres-Finanzdaten, Management-Informationen und Echtzeit-Updates bietet Implisense eine **API/MCP-Schnittstelle**. ChatGPT kann diese über **Custom GPT Actions** (OpenAPI) oder einen **MCP-Connector** direkt anbinden — Details auf Anfrage.

→ [implisense.com/api](https://www.implisense.com)
