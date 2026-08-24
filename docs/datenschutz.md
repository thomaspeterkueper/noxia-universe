# Datenschutzerklärung

## 1. Verantwortlicher

Thomas Peter Küper  
Mörfelder Landstraße 103  
60598 Frankfurt am Main  
E-Mail: t.kueper@camaleo.de

## 2. Hosting

NOXIA wird über **Vercel Inc.**, 340 Pine Street, Suite 701, San Francisco, CA 94104, USA, gehostet. Beim Seitenaufruf verarbeitet Vercel technisch notwendige Zugriffsdaten:

- IP-Adresse
- Zeitpunkt der Anfrage
- Aufgerufene Ressource
- Referrer-URL
- Browser- und Betriebssystemkennung

Rechtsgrundlage: Art. 6 Abs. 1 lit. f DSGVO (berechtigtes Interesse am sicheren Betrieb). Mit Vercel besteht ein Auftragsverarbeitungsvertrag gemäß Art. 28 DSGVO. Weitere Informationen: [vercel.com/legal/privacy-policy](https://vercel.com/legal/privacy-policy)

## 3. Schriftarten

Die verwendeten Schriftarten (Courier Prime, Playfair Display, Geist, Geist Mono) werden beim Build serverseitig geladen und lokal ausgeliefert. Beim Aufruf der Website findet keine Verbindung zu Google Fonts statt.

## 4. Benutzerkonten und Authentifizierung

NOXIA verwendet **Supabase** (Supabase Inc., 970 Trestle Glen Rd, Oakland, CA 94610, USA) als Datenbank- und Authentifizierungsdienst. Die Datenbank-Server befinden sich in einer EU-Region.

**Registrierung und Anmeldung:** E-Mail-Adresse und Passwort. Kein OAuth, kein Magic Link. Passwort-Reset per E-Mail möglich.

**Sitzungsverwaltung:** Cookie-basiert (Supabase-Standard-Session-Cookies).

**Gespeicherte Daten:**  
Beim Anlegen eines Kontos werden folgende Daten verarbeitet:

- Authentifizierungsdaten: E-Mail-Adresse und gehashtes Passwort (in `auth.users`, verwaltet durch Supabase)
- Spielprofil: Nutzer-UUID, Benutzername, Spielstand (Credits)
- Spielzustände: Gebäude, Schiffe, Handelsaufträge sowie Spielaktions- und Ereignisdaten (über die Nutzer-UUID verknüpft)

Welt- und Simulationsdaten (Orte, Ressourcen, Marktpreise) sind nicht personenbezogen.

**Rechtsgrundlage:** Art. 6 Abs. 1 lit. b DSGVO (Vertragserfüllung/Nutzungsverhältnis).

**Speicherdauer:**  
- Konten ohne Aktivität werden nach 6 Monaten gelöscht.
- Registrierungen mit unbestätigter E-Mail-Adresse werden nach 1 Monat gelöscht.
- Darüber hinaus Speicherung bis zur Löschanfrage des Nutzers.

**Löschung:** Die Löschung des Kontos entfernt alle verknüpften Datensätze (ON DELETE CASCADE).

Mit Supabase besteht ein Auftragsverarbeitungsvertrag gemäß Art. 28 DSGVO. Weitere Informationen: [supabase.com/privacy](https://supabase.com/privacy)

## 5. Cookies und Tracking

Es werden ausschließlich technisch notwendige Session-Cookies für die Authentifizierung eingesetzt. Keine Analyse-, Marketing- oder Tracking-Cookies.

## 6. Kontaktaufnahme

Bei Kontaktaufnahme per E-Mail werden die übermittelten Angaben ausschließlich zur Bearbeitung der Anfrage verarbeitet und nicht ohne Einwilligung an Dritte weitergegeben. Rechtsgrundlage: Art. 6 Abs. 1 lit. f DSGVO.

## 7. Betroffenenrechte

Sie haben das Recht auf:

- Auskunft (Art. 15 DSGVO)
- Berichtigung (Art. 16 DSGVO)
- Löschung (Art. 17 DSGVO)
- Einschränkung der Verarbeitung (Art. 18 DSGVO)
- Datenübertragbarkeit (Art. 20 DSGVO)
- Widerspruch (Art. 21 DSGVO)

Anfragen richten Sie bitte an: t.kueper@camaleo.de

## 8. Beschwerderecht

Sie können sich bei der zuständigen Datenschutz-Aufsichtsbehörde beschweren. Zuständig ist der **Hessische Beauftragte für Datenschutz und Informationsfreiheit**, Postfach 3163, 65021 Wiesbaden, [datenschutz.hessen.de](https://datenschutz.hessen.de).

---

Stand: August 2026
