# MCP-Setup (für Claude Code)

Diese Anleitung verbindet Claude Code mit dem **Implisense MCP-Server** — danach arbeiten die Skills mit Live-Daten zu **2,3 Millionen deutschen Unternehmen**.

> Du nutzt claude.ai im Browser oder die Claude-App? Dann füge den Server dort als Connector hinzu: **Customize → Connectors → Add custom connector**, URL `https://mcp.implisense.com/`, danach „Connect“ und deinen API-Key eingeben. Ohne API-Key kannst du die Skills in [`projects/`](projects/) mit Beispieldaten ausprobieren (siehe [README.md](README.md)).

## Voraussetzungen

- Claude Code installiert ([Anleitung](https://code.claude.com/docs))
- Ein Implisense-Konto und ein API-Key. Das Konto ist kostenlos (100 Implicents Startguthaben, keine Kreditkarte): [app.implisense.com](https://app.implisense.com) → Einstellungen → Entwickler → API-Keys.

## 1. MCP-Server registrieren

```bash
claude mcp add --transport http implisense https://mcp.implisense.com/
```

## 2. Anmelden

In einer Claude-Code-Sitzung:

```
/mcp
```

`implisense` auswählen und anmelden. Im Browser öffnet sich die Implisense-Seite „API-Zugang verbinden“ — dort deinen API-Key einfügen und „Verbinden“ klicken. Claude Code speichert die Anmeldung; der Key läuft nicht von selbst ab.

Alternativ ohne Browser, mit dem Key als Header:

```bash
claude mcp add --transport http implisense https://mcp.implisense.com/ \
  --header "Authorization: Bearer <DEIN_API_KEY>"
```

**Teile den Key nicht** und committe ihn nicht in ein Repo — er ist an dein Konto und dein Guthaben gebunden.

## 3. Verbindung prüfen

```bash
claude mcp list
```

`implisense` sollte als verbunden erscheinen. Test in einer Sitzung:

```
Zeig mir das Profil der SIM Automation GmbH in Heiligenstadt.
```

## 4. Skills installieren

```bash
curl -fsSL https://raw.githubusercontent.com/implisense/skills/main/claude/install.sh | bash
```

Das legt vier Skills unter `~/.claude/skills/<name>/SKILL.md` an (Quelle: [`../plugin/skills/`](../plugin/skills/)):

| Skill | Was er tut |
|---|---|
| `company-researcher` | Strukturiertes Profil einer Firma: Stammdaten, Management, Finanzen, Änderungen |
| `portfolio-analyst` | Risiko-Check einer Firmenliste (Insolvenz, Liquidation, Verluste) |
| `lead-qualifier` | Zielfirmen zu einem Kundenprofil finden und priorisieren, inkl. Lookalikes |
| `contact-finder` | Ansprechpartner für eine Funktion (Vertrieb, Einkauf, IT, …) mit Quellen |

Beispiele:

```
Analysiere die SIM Automation GmbH in Heiligenstadt.
Prüfe diese Lieferanten auf Risiken: SIM Automation, URT Utz Ratio Technik, DFS Montageautomation.
Finde mittelständische Maschinenbauer in Thüringen, die zu folgendem Profil passen: ...
Wer ist für den Einkauf bei der SIM Automation GmbH zuständig?
```

## Verfügbare MCP-Tools

| Tool | Wofür |
|---|---|
| `company_profile` | Firmenprofil (Stammdaten, Management, Finanzen, Bekanntmachungen) — per Name, Website, USt-ID, LEI oder Registernummer |
| `search_companies` | Firmensuche nach Name, Stichwort, Branche, Größe, Region, Alter |
| `similar_companies` | Ähnliche Firmen zu einer oder mehreren Vorlagen (Lookalikes, Wettbewerber) |
| `recent_changes` | Registeränderungen und Bekanntmachungen seit einem Datum |
| `person_network` | Alle Firmen, in denen eine Person eine Rolle hat |
| `portfolio_risk` | Risiko-Flags für bis zu 100 Firmen auf einmal |
| `find_contacts` | Echtzeit-Recherche von Ansprechpartnern für bestimmte Funktionen, mit Quellen |
| `get_contact_results` | Ergebnis einer laufenden Kontaktsuche abholen |
| `account_status` | Guthaben und Tarif |
| `ping` | Verbindungstest |

## Kosten

Aufrufe werden in Implicents aus deinem Guthaben abgerechnet — je nach Tool und angefragten Daten (z. B. kosten Finanzdaten extra, eine Kontaktsuche 3 Implicents, die bei einem Fehlschlag erstattet werden). `account_status` und `get_contact_results` sind kostenlos. Aktuelle Preise: [implisense.com/de/preise](https://implisense.com/de/preise).

## Troubleshooting

- **„Unauthorized“ / 401:** Key ungültig oder deaktiviert — in `/mcp` „Clear authentication“ wählen und neu anmelden, ggf. mit einem neuen Key.
- **Tool nicht gefunden:** `claude mcp list` prüfen, ob `implisense` verbunden ist; ggf. Claude Code neu starten.
- **„Insufficient Implicents“:** Guthaben aufgebraucht — auf [app.implisense.com](https://app.implisense.com) aufladen. Die Anfrage wurde dann nicht ausgeführt und nicht berechnet.
