create extension if not exists "pgcrypto";

create table if not exists public.companies (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  city text not null,
  state text not null default 'NC',
  industry text not null,
  website_url text,
  modernization_score integer check (modernization_score between 0 and 100),
  opportunity_score integer check (opportunity_score between 0 and 100),
  pipeline_status text not null default 'discovered',
  summary text,
  created_at timestamptz not null default now()
);

create table if not exists public.agents (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  role text not null,
  department text,
  status text not null default 'idle',
  current_task text,
  created_at timestamptz not null default now()
);

create table if not exists public.mockups (
  id uuid primary key default gen_random_uuid(),
  company_id uuid not null references public.companies(id) on delete cascade,
  direction text not null check (direction in ('A','B','C')),
  title text not null,
  rationale text,
  review_status text not null default 'awaiting_review',
  preview_url text,
  created_at timestamptz not null default now()
);

create table if not exists public.approvals (
  id uuid primary key default gen_random_uuid(),
  kind text not null,
  subject_id uuid,
  title text not null,
  detail text,
  status text not null default 'pending',
  created_at timestamptz not null default now(),
  acknowledged_at timestamptz
);

alter table public.companies enable row level security;
alter table public.agents enable row level security;
alter table public.mockups enable row level security;
alter table public.approvals enable row level security;

create policy "authenticated users can read command center data" on public.companies for select to authenticated using (true);
create policy "authenticated users can read agents" on public.agents for select to authenticated using (true);
create policy "authenticated users can read mockups" on public.mockups for select to authenticated using (true);
create policy "authenticated users can read approvals" on public.approvals for select to authenticated using (true);

grant select on public.companies, public.agents, public.mockups, public.approvals to authenticated;
