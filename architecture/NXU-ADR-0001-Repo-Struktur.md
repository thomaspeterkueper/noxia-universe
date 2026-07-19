---
id: NXU-ADR-0001
title: Raumorientierte Repository-Struktur
version: v1.1
status: accepted
created: 2026-07-19
updated: 2026-07-19
author: T.P.K.
namespace: NXU
supersedes: []
related: [NXU-RAUM-0001, EXT-ECO-NXU-20260712-001]
---

# NXU-ADR-0001 — Raumorientierte Repository-Struktur

**Entscheidung:** angenommen
**Umsetzung:** Governance jetzt, physische Migration in separatem Schritt

---

## 1. Kontext

`noxia-universe` wurde als Repo für den Noxia-Raum angelegt. Mit
`NXU-RAUM-0001` ist entschieden, dass es das **autorenseitige
Gesamtwerk-Repository für alle drei Leseräume** wird (Baumeister, Zereya,
Noxia).

Damit stellt sich die Frage, ob Baumeister- und Zereya-Material in die
bestehende, noxia-zentrierte Ordnerstruktur eingefügt oder die Struktur
raumorientiert neu gefasst wird.

---

## 2. Entscheidung

**Raumorientierte Struktur.** Baumeister- und Zereya-Material wird *nicht* in
die bestehende Struktur eingekippt.

```text
noxia-universe/
├── architecture/
│   ├── NXU-RAUM-0001-Raumstruktur.md
│   ├── NXU-ADR-0001-Repo-Struktur.md
│   ├── layers/          # Schichten 1–7, innere Chronologie
│   └── transitions/     # Nahtstellen 1900–1920, 2060–2100
│
├── spaces/
│   ├── baumeister/      # books/ characters/ worldbuilding/
│   ├── zereya/          # books/ characters/ worldbuilding/
│   └── noxia/           # books/ characters/ worldbuilding/
│
├── shared/
│   ├── characters/
│   ├── genealogies/
│   ├── organizations/
│   ├── language/
│   ├── physics/
│   └── worldbuilding/
│
├── timelines/
│   ├── master/
│   ├── baumeister/
│   ├── zereya/
│   └── noxia/
│
├── external-tasks/
└── supabase/
```

### Zuständigkeit im Ökosystem

| Instanz | Rolle |
|---|---|
| **OTA** (`overtime-archive.org`) | kanonisches Archiv, `OTA-*`-Signaturen, versionierte Referenzdokumente |
| **noxia-universe** (NXU) | Source of Truth für Gesamtwerk, Bücher, Manuskripte, Figuren, Worldbuilding, Serienarchitektur |
| **kueper.com** | reale physikalische Grundlagen |
| **KG** | Wissens-/Identitätsebene |

`OTA-*`-Dokumente werden hier **nicht** angelegt (siehe
`EXT-ECO-NXU-20260712-001`). Verweise auf OTA-Dokumente sind zulässig.

---

## 3. Die Trägerregel 🔒

> **Ein Artefakt hat genau einen autorenseitigen Ursprung, kann aber mehrere
> Leseräume berühren. Raumübergreifende Artefakte werden nicht dupliziert,
> sondern gemeinsam geführt und aus den jeweiligen Räumen referenziert.**

### 3.1 Abgrenzungskriterium — wann `shared/`?

Ohne Kriterium wandert fast alles nach `shared/`, weil in diesem Universum
nahezu jedes tragende Element mehrere Räume quert. Deshalb gilt:

> **Räume halten Werke. `shared/` hält Fortdauerndes.**

Ein Artefakt gehört nach `shared/`, wenn es in **mindestens zwei Räumen
erzählerisch trägt** — nicht schon, wenn es dort erwähnt wird.

| | bleibt im Raum | geht nach `shared/` |
|---|---|---|
| **Was** | Romane, Serien, Figuren eines Werks, raumeigene Schauplätze | Genealogien, Sprachen, Physik, Organisationen mit Bestand, Artefakte mit Eigenleben |
| **Test** | „Existiert nur, weil dieses Werk existiert" | „Existierte vorher und existiert nachher weiter" |

**Beispiele:**

| Artefakt | Ort | Begründung |
|---|---|---|
| Adar-/Hüterinnen-Linie | `shared/genealogies/` | trägt Baumeister → Zereya → Noxia |
| Mishkenaz | `shared/language/` | eine Fassung über 62.000 Jahre, keine drei konkurrierenden |
| χ-Feld / AVI | `shared/physics/` | reale Basis + In-Universe-Herleitung, raumübergreifend |
| PROMETHEUS | `shared/organizations/` bzw. `shared/worldbuilding/` | wird in Zereya erlebt, in Noxia erinnert — keine Duplikation |
| Monolithe / Baumeister-Artefakte | `shared/worldbuilding/` | Ursprung Baumeister, Fund Noxia |
| *Nalgae* | `spaces/zereya/books/` | Werk eines Raums |
| *Generation Mars* | `spaces/noxia/books/` | Werk eines Raums |
| Lena Sokolov | `spaces/noxia/characters/` | Figur eines Raums |
| Zereya (Figur) | `shared/characters/` | tritt in Zereya-Raum *und* auf K'ragoss auf |

### 3.2 Referenzsyntax nach `shared/` 🔒

**Entschieden (v1.1):** Raumübergreifende Artefakte werden über eine stabile
logische NXU-Referenz adressiert, nicht primär über Dateipfade oder
Supabase-IDs.

Format:

```text
NXU:shared:<bereich>:<slug>
```

Beispiele:

```text
NXU:shared:genealogies:adar
NXU:shared:language:mishkenaz
NXU:shared:physics:chi-field
NXU:shared:worldbuilding:prometheus
```

Regeln:

1. **Die NXU-Referenz ist die stabile Identität.** Sie bleibt bestehen, wenn
   eine Datei verschoben oder umbenannt wird.
2. **Der relative Pfad ist nur Speicherort.** Er darf zusätzlich angegeben
   oder verlinkt werden, ist aber nicht die referenzielle Identität.
3. **Supabase spiegelt die NXU-Referenz**, sofern ein Artefakt dort als Entität
   geführt wird. Eine Supabase-UUID ist Implementierungsdetail und darf nicht
   als primäre Referenz in Manuskripten oder Worldbuilding-Dokumenten dienen.
4. **Slugs sind dauerhaft.** Änderungen am sichtbaren Namen eines Artefakts
   ändern nicht automatisch dessen Slug.
5. **Keine Raumkopie erzeugt eine neue Identität.** Ein Raum referenziert das
   gemeinsame Artefakt über dieselbe NXU-Referenz.

Empfohlene Markdown-Form:

```markdown
Mishkenaz (`NXU:shared:language:mishkenaz`)
```

Wo ein klickbarer Verweis sinnvoll ist, kann zusätzlich der aktuelle relative
Pfad verwendet werden. Die maschinen- und migrationsstabile Referenz bleibt
jedoch die NXU-ID.

Damit ist die Referenzsyntax vor der physischen Migration festgelegt.

---

## 4. Zwei Adressen pro Werk

Die Raumzuordnung ersetzt nicht die Schichtstruktur. Jedes Werk hat:

- **Schicht** (1–7) — innere chronologische/architektonische Adresse
- **Raum** — Leserzugang, publizistische Adresse

Näherungsweise Abbildung (nicht bijektiv, deshalb beide Adressen nötig):

| Raum | überdeckt grob |
|---|---|
| Baumeister | Schichten 1–5 |
| Zereya | Schicht 6 |
| Noxia | Schicht 7 und darüber hinaus |

> **[OFFEN]** Der Knoten „Generation Mars" ist im *Großen Rahmen* als
> „Schicht 5/Mars-Zukunft" geführt. Nach Repo-Stand ist es die YA-Serie von
> 2091 — also Schicht 7 / Raum Noxia. Zu korrigieren.

---

## 5. Migrationsabbildung

Die physische Migration erfolgt **separat**. Diese Tabelle hält fest, wohin
bestehender Inhalt gehört, damit nichts verlorengeht.

| bisher | künftig |
|---|---|
| `canon/timeline/NXU-TIMELINE-DRAFT-2026-07.md` | `timelines/noxia/` (Inhalt ist Noxia-Raum) |
| `canon/timeline/README.md` | `timelines/README.md`, angepasst |
| `canon/history/README.md` | `architecture/` bzw. entfällt nach OTA-Übernahme |
| `canon/language/mishkenaz.md` | `shared/language/` |
| `canon/physics/chi-field.md` | `shared/physics/` |
| `canon/organizations/` (leer) | `shared/organizations/` |
| `books/generation-mars/` | `spaces/noxia/books/generation-mars/` |
| `books/adult-series/` | `spaces/noxia/books/adult-series/` |
| `characters/` | aufteilen nach Trägerregel §3.1 |
| `worldbuilding/mars\|earth\|belt\|interstellar` | `spaces/noxia/worldbuilding/` |
| `external-tasks/`, `supabase/` | unverändert |

**Hinweis:** `canon/` entfällt als Ordner. Der Begriff „Kanon" bleibt beim
**OTA**; NXU führt autorenseitige Quellen. Das ist keine Herabstufung, sondern
die Zuständigkeitsgrenze aus `EXT-ECO-NXU-20260712-001`.

---

## 6. Umsetzungsreihenfolge 🔒

> **Erst Zuständigkeit und Architektur entscheiden, dann Dateien bewegen.**

1. README auf Gesamtwerk-Scope umstellen ✅ *(dieser Schritt)*
2. `NXU-RAUM-0001` auf v1.1 aktualisieren ✅ *(dieser Schritt)*
3. Dieses ADR anlegen ✅ *(dieser Schritt)*
4. Referenzsyntax `shared/` setzen ✅ *(NXU-ID, v1.1)*
5. Physische Migration der bestehenden Ordner
6. Import Baumeister-/Zereya-Material aus *Der Große Rahmen* und den
   Projektdokumenten

**Praxishinweis:** Ordner erst anlegen, wenn sie befüllt werden. Neun
Raum-Unterordner plus `shared/` plus vier Timeline-Ordner als leeres Gerüst
erzeugen Navigationsaufwand ohne Gegenwert. `.gitkeep` nur dort, wo der Import
unmittelbar bevorsteht.

---

## 7. Konsequenzen

**Positiv:** Keine Duplikation raumübergreifender Artefakte. Die
Hüterinnen-Linie muss nicht künstlich einem Raum zugeschlagen werden. Mishkenaz
behält eine Fassung. Neue Räume wären additiv möglich.

**Negativ:** Der Repo-Name `noxia-universe` ist nun enger als sein Scope.
Bewusst in Kauf genommen — Umbenennen erzeugt derzeit mehr Reibung als Nutzen
(Remotes, Supabase-Projektname, Vercel, bestehende External Tasks). Zu
überprüfen, sobald ein größerer Umbau ohnehin ansteht.

**Risiko:** `shared/` als Halde. Gegenmittel ist §3.1 — bei Zweifel bleibt ein
Artefakt im Raum und wandert erst, wenn der zweite Raum es tatsächlich trägt.
