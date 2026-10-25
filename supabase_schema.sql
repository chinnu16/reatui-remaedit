-- ReMa Studio cloud database. Run this in Supabase SQL Editor.
-- Enable Email authentication in Supabase Auth settings before using the cloud login.
create table if not exists public.procurement_items (
  id text primary key,
  sku text,
  user_id uuid not null references auth.users(id) on delete cascade,
  status text not null default 'In stock',
  saree_type text not null default '',
  color text not null default '',
  cost_price numeric(12,2) not null default 0,
  selling_price numeric(12,2) not null default 0,
  profit numeric(12,2) not null default 0,
  final_price numeric(12,2) not null default 0,
  payment_status text not null default 'Not set',
  customer text not null default '',
  gst text not null default '',
  stock_note text not null default '',
  notes text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
alter table public.procurement_items enable row level security;
drop policy if exists "Users can read own procurement items" on public.procurement_items;
drop policy if exists "Users can insert own procurement items" on public.procurement_items;
drop policy if exists "Users can update own procurement items" on public.procurement_items;
drop policy if exists "Users can delete own procurement items" on public.procurement_items;
create policy "Users can read own procurement items" on public.procurement_items for select using (auth.uid() = user_id);
create policy "Users can insert own procurement items" on public.procurement_items for insert with check (auth.uid() = user_id);
create policy "Users can update own procurement items" on public.procurement_items for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users can delete own procurement items" on public.procurement_items for delete using (auth.uid() = user_id);
create index if not exists procurement_items_user_id_idx on public.procurement_items(user_id);
