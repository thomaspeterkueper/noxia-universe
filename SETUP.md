# SETUP — noxia-universe

Entwicklungsumgebung einrichten für das Noxia Universe Repository.

---

## Voraussetzungen

- Node.js 18+
- pnpm
- Supabase Account (Projekt: `noxia-universe`)
- Vercel Account (Pro)

---

## Environment Variables

Erstelle eine `.env.local` Datei im Projektroot:

```env
NEXT_PUBLIC_SUPABASE_URL=https://rtuakwdaktaabvspmoyu.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=<dein-anon-key>
SUPABASE_SERVICE_ROLE_KEY=<dein-service-role-key>
```

**Niemals** `.env.local` ins Repository committen — sie steht in `.gitignore`.

---

## Supabase

Das Schema liegt unter `supabase/schema.sql`.

Bei einem neuen Projekt:
1. Supabase Dashboard → SQL Editor
2. Inhalt von `supabase/schema.sql` einfügen
3. Run

---

## Vercel

1. Vercel Dashboard → New Project → GitHub Repo `noxia-universe` importieren
2. Environment Variables aus `.env.local` dort eintragen
3. Deploy

---

## Repo-Struktur

```
noxia-universe/
├── canon/
│   ├── timeline/        # OTA-TIMELINE-ABGLEICH und Versionen
│   ├── history/         # OTA-HIS-XXXX Dokumente
│   ├── language/        # Mishkenaz, OTA-LIT-XXXX
│   ├── organizations/   # SSF, Bewahrer, etc.
│   └── physics/         # AVI-Modell, χ-Feld
├── books/
│   ├── generation-mars/ # YA-Serie
│   │   └── band-01/
│   └── adult-series/
├── characters/          # Charakterbibeln
├── worldbuilding/
│   ├── mars/
│   ├── earth/
│   ├── belt/
│   └── interstellar/
├── supabase/
│   └── schema.sql
├── .env.example
├── .gitignore
├── README.md
└── SETUP.md
```

---

## Kanon-Dokumente

Alle Kanon-Dokumente folgen der OTA-Namenskonvention:

| Prefix | Typ |
|--------|-----|
| `OTA-HIS-XXXX` | Historische Ereignisse |
| `OTA-LIT-XXXX` | Sprache & Linguistik |
| `OTA-TEC-XXXX` | Technologie & Systeme |
| `OTA-ORG-XXXX` | Organisationen |
| `OTA-TIMELINE` | Master-Timeline |

Neue Dokumente immer mit Version `v1.0` beginnen.
