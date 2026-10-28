create table if not exists public.flappy_shark_scores (
  player_id text primary key,
  player_name text not null check (char_length(btrim(player_name)) between 1 and 16),
  high_score integer not null default 0 check (high_score >= 0),
  updated_at timestamptz not null default now()
);

alter table public.flappy_shark_scores enable row level security;

drop policy if exists "Anyone can read Flappy Shark scores" on public.flappy_shark_scores;
create policy "Anyone can read Flappy Shark scores"
  on public.flappy_shark_scores for select
  using (true);

drop policy if exists "Anyone can add Flappy Shark scores" on public.flappy_shark_scores;
create policy "Anyone can add Flappy Shark scores"
  on public.flappy_shark_scores for insert
  with check (true);

drop policy if exists "Anyone can update Flappy Shark scores" on public.flappy_shark_scores;
create policy "Anyone can update Flappy Shark scores"
  on public.flappy_shark_scores for update
  using (true)
  with check (true);

grant select, insert, update on public.flappy_shark_scores to anon, authenticated;
