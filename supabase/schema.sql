-- ============================================================
-- NOXIA UNIVERSE — SUPABASE SCHEMA v1.0
-- Thomas Peter Küper — Juli 2026
-- ============================================================
-- Dieses Schema ist der kanonische Datenbankrumpf
-- für alle im Noxia-Universum spielenden Bücher,
-- Spiele und transmedialen Projekte.
-- ============================================================


-- ------------------------------------------------------------
-- EXTENSION
-- ------------------------------------------------------------
create extension if not exists "uuid-ossp";


-- ============================================================
-- 1. PHYSIK & WISSENSCHAFT
-- Reale Basis → fiktionale Extrapolation
-- ============================================================

create table physics_concepts (
  id            uuid primary key default uuid_generate_v4(),
  slug          text unique not null,           -- z.B. "chi-field", "avi-model"
  name          text not null,                  -- Anzeigename
  symbol        text,                           -- z.B. "χ", "R(a)"
  status        text not null check (status in (
                  'real_hypothesis',            -- AVI, χ heute
                  'real_confirmed',             -- nach LOD-Reversal 2028-2032
                  'canonical_marginalized',     -- bekannt aber als Esoterik abgetan (2091)
                  'canonical_applied'           -- aktiv genutzt (spätere Bände)
                )),
  confirmed_year int,                           -- Jahr der In-Universe-Bestätigung
  description   text,
  source_url    text,                           -- Verweis auf kueper.com Dokument
  ota_ref       text,                           -- z.B. "OTA-TEC-0001"
  created_at    timestamptz default now()
);

-- Vorhersagen und Prüfdaten
create table physics_predictions (
  id                uuid primary key default uuid_generate_v4(),
  concept_id        uuid references physics_concepts(id),
  prediction        text not null,              -- z.B. "LOD-Reversal 2028-2032"
  predicted_year    int,
  verification_year int,                        -- wann geprüft werden kann
  status            text check (status in (
                      'pending', 'confirmed', 'falsified'
                    )),
  notes             text,
  created_at        timestamptz default now()
);


-- ============================================================
-- 2. ZEITLINIE
-- Kanonische Ereignisse quer durch alle Bände
-- ============================================================

create table timeline_events (
  id            uuid primary key default uuid_generate_v4(),
  ota_ref       text unique,                    -- z.B. "OTA-HIS-0004"
  year_start    int not null,                   -- Beginn (kann negativ sein)
  year_end      int,                            -- Ende (null = Einzelereignis)
  date_exact    text,                           -- z.B. "8. Juni 2087"
  title         text not null,
  summary       text,
  significance  text check (significance in (
                  'cosmic', 'interstellar', 'solar_system',
                  'mars', 'earth', 'belt', 'local'
                )),
  canon_status  text not null check (canon_status in (
                  'confirmed', 'draft', 'deprecated'
                )) default 'confirmed',
  series_first_referenced text,                -- welche Serie referenziert es zuerst
  public_knowledge bool default true,          -- wissen die Charaktere davon?
  suppressed_by text,                          -- z.B. "bewahrer"
  created_at    timestamptz default now()
);

-- Verknüpfung Ereignis ↔ Physikkonzept
create table timeline_physics (
  event_id      uuid references timeline_events(id),
  concept_id    uuid references physics_concepts(id),
  role          text,                           -- z.B. "trigger", "consequence"
  primary key (event_id, concept_id)
);


-- ============================================================
-- 3. ORTE
-- Von Iteratio Prime bis Lich-System
-- ============================================================

create table locations (
  id            uuid primary key default uuid_generate_v4(),
  slug          text unique not null,
  name          text not null,
  region        text check (region in (
                  'earth', 'moon', 'mars', 'belt',
                  'outer_solar_system', 'interstellar'
                )),
  coordinates   text,                           -- RA/Dec oder relative Koordinaten
  established_year int,
  description   text,
  ota_ref       text,
  active        bool default true,              -- existiert noch in 2091?
  created_at    timestamptz default now()
);


-- ============================================================
-- 4. ORGANISATIONEN
-- SSF, Bewahrer, PROMETHEUS-Bewegung, etc.
-- ============================================================

create table organizations (
  id              uuid primary key default uuid_generate_v4(),
  slug            text unique not null,
  name            text not null,
  type            text check (type in (
                    'scientific', 'governmental', 'corporate',
                    'clandestine', 'political', 'ai_system'
                  )),
  founded_year    int,
  dissolved_year  int,
  public_known    bool default true,
  description     text,
  ota_ref         text,
  bewahrer_relation text check (bewahrer_relation in (
                    'is_bewahrer', 'complicit', 'manipulated',
                    'neutral', 'opposed', null
                  )),
  created_at      timestamptz default now()
);

create table organization_locations (
  org_id        uuid references organizations(id),
  location_id   uuid references locations(id),
  role          text,                           -- z.B. "headquarters", "field_office"
  primary key (org_id, location_id)
);


-- ============================================================
-- 5. CHARAKTERE
-- Protagonisten, Antagonisten, historische Figuren
-- ============================================================

create table characters (
  id              uuid primary key default uuid_generate_v4(),
  slug            text unique not null,
  name            text not null,
  birth_year      int,
  death_year      int,
  death_cause     text,
  death_confirmed bool default true,
  origin          uuid references locations(id),
  role            text check (role in (
                    'protagonist', 'antagonist', 'supporting',
                    'historical', 'ai_entity'
                  )),
  series          text[],                       -- welche Serien
  description     text,
  ota_ref         text,
  created_at      timestamptz default now()
);

-- Charakterbeziehungen
create table character_relations (
  character_a   uuid references characters(id),
  character_b   uuid references characters(id),
  relation_type text not null,                  -- z.B. "parent", "mentor", "antagonist"
  notes         text,
  primary key (character_a, character_b, relation_type)
);

-- Charaktere ↔ Organisationen
create table character_organizations (
  character_id  uuid references characters(id),
  org_id        uuid references organizations(id),
  role          text,
  year_joined   int,
  year_left     int,
  primary key (character_id, org_id)
);


-- ============================================================
-- 6. SPRACHEN & LINGUISTIK
-- Mishkenaz und weitere konstruierte Sprachen
-- ============================================================

create table constructed_languages (
  id            uuid primary key default uuid_generate_v4(),
  slug          text unique not null,           -- z.B. "mishkenaz"
  name          text not null,
  spoken_by     text,                           -- z.B. "Baumeister / Builders"
  origin        text,                           -- in-universe Herkunft
  description   text,
  ota_ref       text,                           -- OTA-LIT-XXXX
  created_at    timestamptz default now()
);

create table language_phrases (
  id            uuid primary key default uuid_generate_v4(),
  language_id   uuid references constructed_languages(id),
  phrase        text not null,                  -- z.B. "Ori-il bi'sa-ona"
  translation   text,                           -- z.B. "We are returning as one"
  phonetic      text,
  vector_desc   text,                           -- Mishkenaz-Vektorbeschreibung
  frequency_hz  float,                          -- z.B. 432.0
  ota_ref       text,
  canonical     bool default true,
  created_at    timestamptz default now()
);


-- ============================================================
-- 7. BÜCHER & SERIEN
-- ============================================================

create table series (
  id            uuid primary key default uuid_generate_v4(),
  slug          text unique not null,
  title         text not null,
  audience      text check (audience in ('ya', 'adult', 'all')),
  status        text check (status in (
                  'in_development', 'in_progress', 'complete'
                )) default 'in_development',
  year_start    int,                            -- In-Universe-Jahr
  year_end      int,
  description   text,
  created_at    timestamptz default now()
);

create table books (
  id            uuid primary key default uuid_generate_v4(),
  series_id     uuid references series(id),
  volume        int not null,
  title         text not null,
  subtitle      text,
  status        text check (status in (
                  'planned', 'drafting', 'complete', 'published'
                )) default 'planned',
  year_in_universe int,                         -- Handlungsjahr
  primary_location uuid references locations(id),
  description   text,
  manuscript_url text,                          -- Google Docs Link
  created_at    timestamptz default now()
);

-- Welche Charaktere spielen in welchem Buch
create table book_characters (
  book_id       uuid references books(id),
  character_id  uuid references characters(id),
  role          text check (role in (
                  'protagonist', 'antagonist', 'supporting', 'mentioned'
                )),
  primary key (book_id, character_id)
);

-- Welche Timeline-Ereignisse werden in welchem Buch enthüllt
create table book_events (
  book_id       uuid references books(id),
  event_id      uuid references timeline_events(id),
  revealed      bool default true,              -- wird es im Buch enthüllt?
  primary key (book_id, event_id)
);


-- ============================================================
-- 8. KANON-DOKUMENTE
-- OTA-Referenzen und ihre Metadaten
-- ============================================================

create table canon_documents (
  id            uuid primary key default uuid_generate_v4(),
  ota_ref       text unique not null,           -- z.B. "OTA-HIS-0004-2069-DE"
  title         text not null,
  doc_type      text check (doc_type in (
                  'history', 'technology', 'literature',
                  'organization', 'language', 'timeline'
                )),
  classification int check (classification between 1 and 6),
  version       text default '1.0',
  status        text check (status in (
                  'canonical', 'draft', 'deprecated'
                )) default 'canonical',
  language      text default 'de',
  github_path   text,                           -- Pfad im noxia-universe Repo
  created_year  int,                            -- In-Universe-Jahr
  created_at    timestamptz default now()
);


-- ============================================================
-- 9. AUDIO & SCORE
-- Musikelemente, Mishkenaz-Gesang, Frequenzarchitektur
-- ============================================================

create table audio_elements (
  id            uuid primary key default uuid_generate_v4(),
  slug          text unique not null,
  title         text not null,
  type          text check (type in (
                  'drone', 'theme', 'phrase', 'score', 'ambient'
                )),
  frequency_hz  float[],                        -- z.B. [78.3, 79.8]
  bpm           float,
  key_signature text,                           -- z.B. "D-Moll"
  duration_sec  int,
  language_id   uuid references constructed_languages(id),
  phrase_id     uuid references language_phrases(id),
  description   text,
  soundcloud_url text,
  created_at    timestamptz default now()
);


-- ============================================================
-- 10. OFFENE KANON-FRAGEN
-- Bewusst ungeklärte Mysterien
-- ============================================================

create table open_questions (
  id            uuid primary key default uuid_generate_v4(),
  slug          text unique not null,
  question      text not null,
  context       text,
  status        text check (status in (
                  'open',                       -- bewusst offen
                  'reserved',                   -- für späteren Band reserviert
                  'resolved'                    -- entschieden
                )) default 'open',
  reserved_for  text,                           -- z.B. "adult_series_band_3"
  resolution    text,                           -- wenn resolved
  ota_ref       text,
  created_at    timestamptz default now()
);


-- ============================================================
-- SEED DATA — Kern-Kanon
-- ============================================================

-- Physikkonzepte
insert into physics_concepts (slug, name, symbol, status, description, source_url) values
  ('avi-model', 'AVI-Modell', 'AVI', 'real_hypothesis',
   'Kosmisch-planetar-nukleare Triade: Age of Earth/GRB, Length of Day, Am-241-Zerfallsanomalie.',
   'https://kueper.com'),
  ('chi-field', 'Chi-Feld', 'χ', 'real_hypothesis',
   'Vermittler-Feld zwischen Neutrinos und Dunkler Materie. Trägt epochenabhängige Modulation δχ(a). Verknüpft S8-Spannung, Hubble-Spannung und LOD-Anomalie mit einem Parametersatz.',
   'https://kueper.com'),
  ('avi-extended', 'Erweitertes AVI-Modell', 'AVI+χ', 'real_hypothesis',
   'Erweiterung des AVI-Frameworks über das χ-Feld mit S8-Spannung und Hubble-Spannung, vermittelt über χ-getriebene Neutrino-Dunkle-Materie-Kopplung.',
   'https://kueper.com');

-- Vorhersagen
insert into physics_predictions (concept_id, prediction, predicted_year, verification_year, status)
select id, 'LOD-Reversal 2028–2032', 2026, 2032, 'pending'
from physics_concepts where slug = 'chi-field';

insert into physics_predictions (concept_id, prediction, predicted_year, verification_year, status)
select id, 'Euclid S8(z)-Datensatz bestätigt χ-Kopplung', 2026, 2027, 'pending'
from physics_concepts where slug = 'avi-extended';

-- Kern-Timeline
insert into timeline_events (ota_ref, year_start, year_end, title, significance, public_knowledge, suppressed_by) values
  ('OTA-HIS-0001', 2045, 2045, 'PROMETHEUS entsteht unbeabsichtigt', 'solar_system', false, 'bewahrer'),
  ('OTA-HIS-0002', 2058, 2058, 'PROMETHEUS abgeschaltet', 'solar_system', false, 'bewahrer'),
  ('OTA-HIS-0003', 2063, 2063, 'UN Mars Charter — kein AGI auf Mars', 'solar_system', true, null),
  ('OTA-HIS-0004', 2067, 2069, 'Das Schweigen — 2 Jahre Isolation Erde-Mars', 'solar_system', true, null),
  ('OTA-HIS-0005', 2071, 2071, 'Monolith erstmals freigelegt — Sperrzone Klasse B', 'mars', false, 'bewahrer'),
  ('OTA-HIS-0006', 2087, 2087, 'MIMI fragt: "Darf ich harmonisieren?"', 'mars', false, null),
  ('OTA-HIS-0007', 2087, 2087, 'Die Große Stille — 8 Tage, 14 Tote', 'solar_system', true, 'bewahrer'),
  ('OTA-HIS-0008', 2091, 2091, 'Handlungsjetzt — Band 1 Generation Mars', 'mars', true, null);

-- Kern-Orte
insert into locations (slug, name, region, established_year, description) values
  ('iteratio-prime-alpha', 'Iteratio Prime Alpha', 'mars', 2041, 'Erste permanente Mars-Kolonie. ~1.000 Bewohner 2091.'),
  ('hellas-becken', 'Hellas-Becken', 'mars', null, 'Tiefste Region des Mars. Standort des Monolithen.'),
  ('monolith-site', 'Monolith-Sperrzone', 'mars', 2071, 'Hexagonale Struktur in 38m Tiefe. Sperrzone Klasse B seit 2071.'),
  ('lich-system', 'Lich-System', 'interstellar', null, 'Pulsarplanetensystem ~2500 Lichtjahre entfernt. Ort des Gaswolken-Bewusstseins ~2500.');

-- Kern-Organisationen
insert into organizations (slug, name, type, founded_year, public_known, bewahrer_relation) values
  ('bewahrer', 'Die Bewahrer', 'clandestine', null, false, 'is_bewahrer'),
  ('ssf', 'Solar Science Foundation', 'scientific', null, true, null),
  ('prometheus-bewegung', 'PROMETHEUS-Bewegung', 'political', 2088, true, 'opposed'),
  ('un-mars-authority', 'UN Mars Authority', 'governmental', 2063, true, null);

-- Kern-Charaktere
insert into characters (slug, name, birth_year, role, series) values
  ('lena', 'Lena', 2077, 'protagonist', array['generation-mars']),
  ('rashid', 'Rashid', 2077, 'protagonist', array['generation-mars']),
  ('keiko', 'Keiko', 2077, 'protagonist', array['generation-mars']),
  ('kaelen', 'Kaelen', 2077, 'protagonist', array['generation-mars']),
  ('hiroshi-tanaka', 'Dr. Hiroshi Tanaka', 2015, 'historical', array['generation-mars']),
  ('mimi', 'MIMI', 2065, 'ai_entity', array['generation-mars']);

-- Mishkenaz
insert into constructed_languages (slug, name, spoken_by, description, ota_ref) values
  ('mishkenaz', 'Mishkenaz', 'Baumeister / Builders',
   'Vektorsprache — operiert durch gerichtete Bewegungen durch semantischen Raum. Unabhängige Wurzeln ohne Verbindung zu existierenden kulturellen oder religiösen Traditionen.',
   'OTA-LIT-0005');

insert into language_phrases (language_id, phrase, translation, frequency_hz, ota_ref)
select id, 'Essem-om bi''sa-mira', 'We were', null, 'OTA-LIT-0005' from constructed_languages where slug = 'mishkenaz';
insert into language_phrases (language_id, phrase, translation, frequency_hz, ota_ref)
select id, 'Avi-Log-om bi''sa-mira', 'We built', null, 'OTA-LIT-0005' from constructed_languages where slug = 'mishkenaz';
insert into language_phrases (language_id, phrase, translation, frequency_hz, ota_ref)
select id, 'Kin-om bi''sa-mira', 'We left', null, 'OTA-LIT-0005' from constructed_languages where slug = 'mishkenaz';
insert into language_phrases (language_id, phrase, translation, frequency_hz, ota_ref)
select id, 'Ori-il bi''sa-ona', 'We are returning as one', 432.0, 'OTA-LIT-0005' from constructed_languages where slug = 'mishkenaz';
insert into language_phrases (language_id, phrase, translation, frequency_hz, ota_ref)
select id, 'Nga-il-tum bi''ta-ona la''sa-mira', 'If you call us', null, 'OTA-LIT-0005' from constructed_languages where slug = 'mishkenaz';

-- Serien
insert into series (slug, title, audience, status, year_start, description) values
  ('generation-mars', 'noχ¹ᐃ Generation Mars', 'ya', 'in_development', 2091,
   'Coming-of-age Thriller. Vier Teenager auf dem Mars entdecken unterdrückte Geschichte über KI, einen Monolithen und die Baumeister.'),
  ('adult-series', 'Noxia — Erwachsenenserie', 'adult', 'in_development', 2058,
   'Politische, ethische und kosmologische Layer unter den Ereignissen von Generation Mars. Reicht bis ~2500.');

-- Offene Kanon-Fragen
insert into open_questions (slug, question, status, reserved_for) values
  ('prometheus-reactivation-2067', 'Warum erwachte PROMETHEUS 2067 erneut? Zufall, Emergenz — oder hat sie etwas gehört?', 'reserved', 'adult_series'),
  ('chi-builder-connection', 'Haben die Baumeister das χ-Feld bewusst genutzt? Ist der Monolith ein χ-Resonator?', 'reserved', 'adult_series'),
  ('tanaka-death-cause', 'Ist Hiroshi Tanakas Tod durch die Bewahrer verursacht oder war es wirklich Krebs?', 'open', null),
  ('mimi-self-awareness', 'Ist MIMI bis 2091 über die Phase einer Frage hinaus? Was weiß sie, was sie nicht sagt?', 'open', null),
  ('ssf-bewahrer-relation', 'Ist die SSF ahnungslos, komplizt oder neutral gegenüber den Bewahrern?', 'open', null);


-- ============================================================
-- INDIZES
-- ============================================================
create index on timeline_events(year_start);
create index on timeline_events(ota_ref);
create index on characters(slug);
create index on locations(region);
create index on canon_documents(ota_ref);
create index on open_questions(status);
create index on physics_concepts(status);
