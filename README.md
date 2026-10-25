# ReMa Studio — Interactive Procurement & Retail Workspace

A responsive React + Vite app with a richer, multi-page interface for the Procurement sheet only. It includes Overview, Inventory (grid/list), Procurement, Sales & Payments, Customers, and Insights; add/edit/delete flows; search and filters; CSV import/export; and responsive layouts.

## Run locally

Requirements: Node.js 18+.

```bash
npm install
npm run dev
```

## Build

```bash
npm run build
npm run preview
```

## Deploy to Vercel (recommended)

1. Push this project to a new GitHub repository or a separate folder/branch. Do not upload this React project over the old Streamlit project without keeping a rollback commit.
2. In Vercel, import the GitHub repository.
3. Framework preset: Vite. Build command: `npm run build`. Output directory: `dist`.
4. For a quick demo, deploy without environment variables; data is saved only in the current browser using localStorage.
5. For real business use and syncing across devices, configure Supabase as below before entering real data.

## Supabase setup for persistent, private data

1. Create a Supabase project and enable Email authentication.
2. In the SQL Editor, run `supabase_schema.sql`.
3. In Vercel Project Settings → Environment Variables, set:
   - `VITE_SUPABASE_URL` = your Supabase Project URL
   - `VITE_SUPABASE_ANON_KEY` = your Supabase publishable/anon key
4. Redeploy. The app will show a sign-in/create-account screen and use the authenticated user's RLS-protected records.
5. Do not use a service-role key in frontend environment variables. Only use the anon/publishable key with RLS enabled.

## Data notes

- The starter data was cleaned from the `Procurement` sheet only; the `Balance Sheet` tab is not imported.
- The original worksheet contains repeated headers and summary rows, which were excluded from the seed data.
- The source has no reliable transaction dates. The charts intentionally avoid inventing historical monthly sales trends.
- Local demo mode uses browser localStorage. It is not shared across devices and can be lost if browser storage is cleared. Use Supabase for persistent, authenticated cloud storage.
- A demo user can create a new Supabase account through the UI. To protect a private business workspace, restrict sign-ups in Supabase Auth after creating the intended account, or apply your preferred invite-only policy.

## Main features

- Overview KPIs, inventory distribution, collection mix and recent activity
- Inventory product-card / table views, colour swatches, search, filters and sorting
- Procurement ledger and CSV import/export
- Sales/payment follow-up tabs and customer rollups
- Add/edit forms and delete confirmation
- Responsive sidebar and layouts for phone and desktop
