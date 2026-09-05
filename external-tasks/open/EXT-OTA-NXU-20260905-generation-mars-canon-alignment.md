---
id: EXT-OTA-NXU-20260905-generation-mars-canon-alignment
title: Generation-Mars-Figurenstand mit reconciliertem OTA-Kanon abgleichen
status: open
source: OTA
target: NXU
created: 2026-09-05
priority: high
affects: [NXU, OTA, KG]
---

# Generation-Mars-Figurenstand mit reconciliertem OTA-Kanon abgleichen

## Anlass

Bei der Bearbeitung von `EXT-NXU-OTA-20260830-001` wurde sichtbar, dass ältere strukturierte NXU-/Seed-Stände und ältere OTA-Biografien nicht mehr vollständig dem aktuellen autorenseitigen Generation-Mars-Stand entsprechen. OTA hat seine narrativen Dossiers jetzt historisiert beziehungsweise als neue Nachfolger reconciliert.

NXU soll seinen strukturierten Figurenstand gegen diese Autorentscheidungen prüfen und stale Seed-/Fixture-Daten korrigieren, ohne neue Fakten zu erfinden.

## Zu prüfende Leitplanken

- **Rashid Al-Mansouri:** Geburtsjahr **2079**; Dubai; Eltern Hassan und Layla Al-Mansouri; Schwester Aisha; SYELP Phase 1 Erde→Mars 2092.
- **Kaelen:** ca. **2079**, Ceres/Belt; they/them bzw. dey/deren; Belt-Physiologie; trainierte taktile Strukturwahrnehmung, ausdrücklich nicht metaphysisch; SYELP Phase 2.
- **Lena Kowalski:** **2077**, Iteratio Prime Alpha, Sektor Omega-7; Vater Gerhard Kowalski, Wartungstechniker; Mutter verstorben, weitere Details offen/klassifiziert; akustische Hypersensitivität bei Dr. Hong registriert; Monolith-Signal Januar 2092; SYELP Phase 2 Mars→Erde.
- **Keiko Nakamura:** ca. **2077**, Iteratio Prime Alpha, Sektor B; Vater Dr. Hiroshi Tanaka, Geophysiker, verstorben; Todesjahr und Todesursache offen; historiografische Disposition; verschlüsselte Audiodatei des Vaters, Inhalt unbekannt; SYELP Phase 2.

## OTA-Zielreferenzen

- Lena: `DOC:OTA:OTA-BIO-0036-2092-DE`
- Rashid: `DOC:OTA:OTA-BIO-0035-2092-DE`
- Keiko: `DOC:OTA:OTA-BIO-0037-2092-DE`
- Kaelen: `DOC:OTA:OTA-BIO-0014-2092-DE` (`ENTWURF`/partial)

## Requested Change

1. Aktuelle `CHAR:NXU:*`-Datensätze, SQL-Seeds, Fixtures und Manuskript-/Canon-Dateien für die vier Figuren gegeneinander prüfen.
2. Stale technische Seedwerte, insbesondere widersprechende Geburtsjahre oder veraltete Familienzuordnungen, an den aktuellen autorenseitigen Stand angleichen.
3. Offene Angaben offen lassen; insbesondere Hiroshi Tanakas Todesjahr/-ursache nicht schließen.
4. Keine alten OTA-Plotdetails wie 432-FREQ-ECHO automatisch in den aktuellen NXU-Kanon zurückübernehmen.
5. Ergebnis mit den vier `CHAR:NXU:*`-IDs und eventuellen verbleibenden Konflikten an OTA/KG zurückmelden.

## Source-of-Truth-Regel

NXU bleibt Source of Truth für Figuren- und Manuskriptkontinuität. Dieser Request ist daher kein Versuch, OTA zum Figurenmaster zu machen, sondern eine Rückmeldung über beim OTA-Abgleich erkannte stale strukturierte Daten.
