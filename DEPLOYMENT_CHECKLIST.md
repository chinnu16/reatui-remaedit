# Deployment checklist

- [ ] Keep the existing Streamlit repository/commit as a rollback path.
- [ ] Deploy this React project to a separate GitHub repository or a dedicated branch.
- [ ] Confirm the Vercel build succeeds.
- [ ] Configure Supabase URL and publishable/anon key as Vercel environment variables.
- [ ] Run `supabase_schema.sql` in Supabase SQL Editor.
- [ ] Test account sign-up and sign-in.
- [ ] Confirm a signed-in user can only see their own records (RLS).
- [ ] Verify starter records are imported only once into an empty account table.
- [ ] Test create, edit, delete, CSV import/export and refresh persistence.
- [ ] Only then add the live business URL to bookmarks / phone home screen.
