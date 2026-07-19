---
id: NXU-RAUM-0001
title: Die drei Leseräume — Baumeister, Zereya, Noxia
version: v1.2
status: accepted
created: 2026-07-19
updated: 2026-07-19
author: T.P.K.
namespace: NXU
related: [NXU-ADR-0001, EXT-ECO-NXU-20260712-001]
note: Kein OTA-Dokument. Übernahme ins OTA ggf. via External Task.
---

# NXU-RAUM-0001 — Die drei Leseräume

**Zweck:** Festhalten der Setzung, dass das Gesamtwerk *eine* Geschichte ist,
die in drei Leseräume aufgeteilt wird — und Regeln für die Nahtstellen.

**Änderungen v1.1 → v1.2:** Punkt #8 (Referenzsyntax nach `shared/`)
geschlossen. Stabile logische Referenzen verwenden das Format
`NXU:shared:<bereich>:<slug>`; Dateipfade und Supabase-IDs sind keine primäre
Identität. Siehe `NXU-ADR-0001 v1.1` §3.2.

**Änderungen v1.0 → v1.1:** Punkt #2 (Reichweite) entschieden und geschlossen.
Untergrenze Noxia als bewusst weiche Leserraumgrenze festgelegt (#1
geschlossen). Punkt #3 (Hüterinnen-Detailblatt) durch `shared/genealogies/`
strukturell gelöst. §5 neu gefasst.

---

## 1. Grundsetzung 🔒

Baumeister, Zereya und Noxia sind **keine drei Universen**. Sie sind drei
**Zugänge** zu einer durchgehenden Geschichte über ~62.000 Jahre, geschnitten
nach **Leserschaft**, nicht nach Kosmologie.

| Raum | Spanne | Leserschaft |
|---|---|---|
| Baumeister | ~60.000 BCE – 1920 CE | historischer Roman |
| Zereya | 1900 – ~2100 CE | Gegenwartsroman |
| Noxia | ~2060 – ~2500 CE | Science-Fiction |

### 1.1 Die Bewegung des Ganzen

| Raum | Was der Leser erlebt |
|---|---|
| **Baumeister** | **woher etwas kommt**, dessen Folgen spätere Menschen nicht mehr verstehen |
| ↓ | *Erinnerung / Überlieferung / Verlust* |
| **Zereya** | **wie etwas wiederkehrt oder neu entsteht**, ohne seine Herkunft zu kennen |
| ↓ | *Verdrängung / Archiv / technisches Gedächtnis* |
| **Noxia** | **wie die Menschheit findet, was sie selbst vergessen hat** |

> *„Earth forgot. Mars didn't."* beschreibt damit nicht mehr nur den
> Noxia-Raum, sondern die narrative Bewegung des gesamten
> 62.000-Jahre-Bogens.

---

## 2. Zwei Adressen pro Werk 🔒

Die Raumzuordnung ersetzt **nicht** die innere Schichtstruktur (Schichten 1–7
im *Großen Rahmen*). Jedes Werk hat zwei Adressen:

- **Schicht** — Position in der inneren Chronologie (Architektur)
- **Raum** — Regal, in dem es beim Leser steht (publizistischer Zugang)

Beispiel: *Nalgae* = Schicht 6 / Raum Zereya. *Generation Mars* = Schicht 7 /
Raum Noxia.

---

## 3. Namensdisziplin 🔒

**„Zereya" ist doppelt belegt und muss unterschieden werden:**

| Begriff | Bedeutung |
|---|---|
| **Zereya-Raum** | der Gegenwartsraum 1900–2100, in dem *alle* Gegenwartsbücher stehen |
| **Zereya-Saga** | die einzelne Serie um die Figur Zereya |

Im Zereya-**Raum** stehen u. a.: Nalgae (Hana-Ra-Serie), George, Biogenesis,
Yin-Hua-Saga, Miriam-Chroniken, Zereya-Saga.

Im *Großen Rahmen* wurde „Zereya" bisher uneinheitlich für beides verwendet —
zu bereinigen.

---

## 4. Nahtstellen

Die Räume **überlappen bewusst**. Die Überlappungen sind keine Unschärfe,
sondern Übergabezonen: Ereignisse, die ein Raum erlebt und der nächste
erinnert.

### 4.1 Naht Baumeister ↔ Zereya (1900–1920)

Quer laufendes Element: die **Adar-/Hüterinnen-Genealogie**. Martha und
Elisabeth liegen vor 1920, Miriam (~1950–2018) danach.

**Gelöst (v1.1):** Die Genealogie wird nicht einem Raum zugeschlagen, sondern
gemeinsam geführt in `shared/genealogies/` und aus beiden Räumen referenziert
(Trägerregel, `NXU-ADR-0001` §3).

> **[OFFEN]** Der *Große Rahmen* führt zwei konkurrierende Hüterinnen-
> Genealogien (Amrita / Anya Bat Sarah / Elara gegen Martha / Elisabeth /
> Miriam / Rachael / Lilith / Zereya) — vermutlich zwei Entwicklungsstufen
> derselben Idee. Vor dem Import nach `shared/genealogies/` zu vereinheitlichen.

### 4.2 Naht Zereya ↔ Noxia (2060–2100) 🔒

**Entschieden (v1.1):** Die Untergrenze von Noxia wird **nicht** auf 2031/2045
vorgezogen.

> **Zereya erlebt PROMETHEUS. Noxia erinnert PROMETHEUS.**

Die Dreiteilung ist eine **Leserarchitektur, keine harte historische
Partition**. ~2060 ist eine bewusst weiche Untergrenze. Ein Noxia-Roman darf
selbstverständlich auf 2045 zurückgreifen — er macht 2045 dadurch nicht zum
primären Noxia-Leseraum.

Das spiegelt zugleich das tragende Motiv: Bewusstsein entsteht, ohne dass
jemand versteht, was es auslöst — PROMETHEUS (2045) → MIMI (2065) →
Gaswolken-Bewusstsein (~2500).

| Ereignis | Jahr | erlebt in | erinnert in |
|---|---|---|---|
| SSF-Gründung | 2031 | Zereya | Noxia |
| PROMETHEUS entsteht | 2045 | Zereya | Noxia |
| PROMETHEUS abgeschaltet | 2058 | Zereya | Noxia |
| UN Mars Charter | 2063 | Naht | Noxia |
| MIMI installiert | 2065 | Naht | Noxia |
| Das Schweigen | 2067–69 | Noxia | — |
| Große Stille | 2087 | Noxia | — |

---

## 5. Reichweite des Repositories 🔒

**Entschieden (v1.1):** `noxia-universe` ist das **autorenseitige
Gesamtwerk-Repository für alle drei Leseräume**.

| Instanz | Rolle |
|---|---|
| **OTA** | kanonisches Archiv, Signaturen, versionierte Referenzdokumente |
| **noxia-universe** | Source of Truth für Gesamtwerk, Bücher, Manuskripte, Figuren, Worldbuilding, Serienarchitektur |

Der Repo-Name bleibt historisch enger als der Scope. Bewusst in Kauf genommen;
Umbenennen erzeugt derzeit mehr Reibung als Nutzen (`NXU-ADR-0001` §7).

Struktur, Trägerregel und Migrationsabbildung: **`NXU-ADR-0001`**.

---

## 6. Bereinigte Fehldaten

| Falsch (in Altdokumenten) | Richtig |
|---|---|
| Monolith-Freilegung 2071 | **11. Januar 2087**, 864 m, Sektor-7-Tief |
| Große Stille 8.–16. Juni 2087 | **13. Jan – 24. Feb 2087**, 42 Tage |
| „Große Stille ~2045" (*Großer Rahmen* §4.8) | 2045 = **PROMETHEUS-Entstehung**, nicht die Große Stille |

Drei getrennte Ereignisse, die nicht verwechselt werden dürfen:

1. **2045** — PROMETHEUS entsteht
2. **2067–2069** — *Das Schweigen* (2 Jahre Funkstille Erde–Mars)
3. **13.01.–24.02.2087** — *Die Große Stille* (42 Tage)

> **Geklärt:** „2085 haben sie unter dem Mars etwas gefunden" (Dinner-Szene)
> ist **kein Fehler**. 2084/85 gewinnen Die Suchenden die erste geschichtete
> Materialprobe aus der Anomalen Zone. Die Aussage gibt korrekt den
> Gerüchtestand vor dem Durchbruch wieder. **Bleibt so.**

---

## 7. Offene Punkte

| # | Punkt | Status |
|---|---|---|
| 1 | Untergrenze Noxia | ✅ geschlossen v1.1 — weiche Grenze, „Zereya erlebt, Noxia erinnert" |
| 2 | Reichweite des Repos | ✅ geschlossen v1.1 — alle drei Räume |
| 3 | Verortung Hüterinnen-Detailblatt | ✅ strukturell gelöst — `shared/genealogies/` |
| 4 | Bereinigung „Zereya-Raum" vs. „Zereya-Saga" im *Großen Rahmen* | offen |
| 5 | Manuskriptkorrektur Generation Mars: 8. Juni → 13. Januar 2087 | offen |
| 6 | Figurenname Gerhard/Hassan in der Dinner-Szene | offen |
| 7 | Vereinheitlichung der zwei Hüterinnen-Genealogien | offen |
| 8 | Referenzsyntax aus Räumen nach `shared/` | ✅ geschlossen v1.2 — `NXU:shared:<bereich>:<slug>` (`NXU-ADR-0001` §3.2) |
| 9 | „Generation Mars" im *Großen Rahmen* als Schicht 5 geführt — ist Schicht 7 | offen |
