# MCP-Setup (für Claude Code)

Diese Anleitung verbindet Claude Code mit dem **Implisense MCP-Server** — danach arbeiten die Skills in `skills/` mit Live-Daten zu **2,3 Millionen deutschen Unternehmen** statt mit den Beispieldaten in `sample-data/`.

> Du nutzt claude.ai im Browser, nicht Claude Code? Dann brauchst du diese Anleitung nicht — nutze stattdessen die Skills in `projects/` mit den Beispieldaten (siehe [README.md](README.md), claude.ai-Pfad).

## Voraussetzungen

- Claude Code installiert ([Anleitung](https://docs.claude.com/en/docs/claude-code))
- Ein Implisense-API-Token (Bearer-Token). Token erhältst du über [implisense.com/api](https://www.implisense.com) bzw. dein Implisense-Konto.

## 1. MCP-Server registrieren

Der Implisense-MCP-Server läuft unter `https://mcp.implisense.com/` (FastMCP, HTTP-Transport, Bearer-Token-Auth).

```bash
claude mcp add implisense \
  --transport http \
  --url https://mcp.implisense.com/ \
  --header "Authorization: Bearer <DEIN_API_TOKEN>"
```

Ersetze `<DEIN_API_TOKEN>` durch dein Implisense-Token. **Teile dieses Token nicht** und committe es nicht in ein Repo — es ist an dein Konto und dein Credit-Guthaben gebunden.

## 2. Verbindung prüfen

```bash
claude mcp list
```

Der Eintrag `implisense` sollte als verbunden angezeigt werden. Du kannst die Verbindung auch direkt in einem Claude-Code-Chat testen:

```
Nutze das company_profile-Tool, um die Siemens AG nachzuschlagen.
```

Wenn Claude eine Antwort mit Stammdaten liefert, ist die Verbindung aktiv.

## 3. Skills installieren (falls noch nicht geschehen)

```bash
curl -fsSL https://raw.githubusercontent.com/implisense/claude-skills/main/claude/install.sh | bash
```

Siehe [`install.sh`](install.sh) für Details.

## 4. Loslegen

Die Skills in `skills/` (Format B) erkennen automatisch, dass MCP verbunden ist, und nutzen Live-Daten statt `sample-data/`. Beispiele:

```
Analysiere die TRUMPF SE.
Erstelle eine Portfolio-Übersicht für: Bosch, Festo, Continental, Knorr-Bremse.
Welche Maschinenbau-Mittelständler in Baden-Württemberg passen zu folgendem Profil: ...
```

## Verfügbare MCP-Tools

| Tool | Wofür |
|---|---|
| `company_profile` | Vollständiges Firmenprofil (Stammdaten, Management, Finanzen, Ankündigungen) |
| `search_companies` | Firmensuche nach Name, Branche, Größe, Standort |
| `similar_companies` | Ähnliche Firmen / Wettbewerber |
| `recent_changes` | Was hat sich seit Datum X bei einer Firma geändert |
| `person_network` | In welchen Firmen ist eine Person involviert |
| `portfolio_risk` | Risiko-Check für eine Liste von Firmen (bis zu 100) |

## Kosten

Jeder MCP-Aufruf verbraucht Credits aus deinem Implisense-Guthaben (abhängig vom Tool und den angefragten Daten, z. B. zusätzliche Kosten für Finanzdaten via `include=financials`). Details und aktuelle Preise: [implisense.com/api](https://www.implisense.com).

## Troubleshooting

- **"Unauthorized" / 401:** Token falsch oder abgelaufen — neues Token im Implisense-Konto generieren und `claude mcp remove implisense` + erneut `claude mcp add` mit neuem Token.
- **Tool nicht gefunden:** `claude mcp list` prüfen, ob `implisense` als "connected" angezeigt wird; ggf. Claude Code neu starten.
- **Rate-Limit-Fehler:** Bei sehr vielen Anfragen in kurzer Zeit (z. B. Autocomplete-artige Aufrufe) kann ein Rate-Limit greifen — kurz warten und erneut versuchen.
