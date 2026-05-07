-- ============================================================
-- BibliaGame · Setup do Supabase
-- ============================================================
-- Como rodar:
-- 1. Acesse seu projeto em https://supabase.com
-- 2. No menu lateral, vá em "SQL Editor"
-- 3. Clique em "New query"
-- 4. Cole TODO este arquivo e clique em "Run"
-- ============================================================

-- Tabela de salas (uma sala = uma partida ativa)
create table rooms (
  code text primary key,
  host_name text not null,
  target int not null default 10,
  status text not null default 'lobby',
  current_card jsonb,
  scores jsonb default '{}'::jsonb,
  winner_name text,
  categories text[] default array[]::text[],
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Tabela de jogadores (aprendizes que entram na sala)
create table players (
  id text primary key,
  room_code text references rooms(code) on delete cascade,
  name text not null,
  joined_at timestamptz default now(),
  last_seen timestamptz default now()
);

-- Habilitar Row Level Security (segurança por linha)
alter table rooms enable row level security;
alter table players enable row level security;

-- Permitir leitura/escrita pública (jogo é gratuito e aberto)
create policy "rooms_all" on rooms for all using (true) with check (true);
create policy "players_all" on players for all using (true) with check (true);

-- ============================================================
-- Após rodar, vá em Settings → API e copie:
-- 1. Project URL (algo como https://xyzabc.supabase.co)
-- 2. anon public key (chave longa começando com "eyJ...")
-- E me envie esses dois valores!
-- ============================================================
