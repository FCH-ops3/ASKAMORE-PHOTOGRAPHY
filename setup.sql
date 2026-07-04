-- ============================================================
-- ASKAMORE PHOTOGRAPHY — Configuration Supabase (V2)
-- À copier-coller dans Supabase > SQL Editor > New query > Run
--
-- Ce script est idempotent : si vous l'avez déjà exécuté pour la V1,
-- vous pouvez le relancer sans risque, il ne recréera pas ce qui existe déjà.
-- Il ajoute uniquement la nouveauté de la V2 : les avis clients partagés.
-- ============================================================

-- 1) Table des photos de la galerie PUBLIQUE (visible par tous les visiteurs)
create table if not exists gallery_photos (
  id uuid primary key default gen_random_uuid(),
  category text not null check (category in ('mariage','fiancailles','gender-reveal','seance-photo')),
  file_path text not null,
  caption text,
  sort_order int default 0,
  created_at timestamptz default now()
);

alter table gallery_photos enable row level security;

drop policy if exists "Lecture publique galerie" on gallery_photos;
create policy "Lecture publique galerie" on gallery_photos
  for select using (true);

drop policy if exists "Ecriture connecte galerie" on gallery_photos;
create policy "Ecriture connecte galerie" on gallery_photos
  for all using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');


-- 2) Table de l'espace PRIVÉ (uniquement visible par vous, jamais par les visiteurs)
create table if not exists private_photos (
  id uuid primary key default gen_random_uuid(),
  owner uuid references auth.users(id) default auth.uid(),
  folder text default 'Non classé',
  file_path text not null,
  caption text,
  created_at timestamptz default now()
);

alter table private_photos enable row level security;

drop policy if exists "Acces prive uniquement au proprietaire" on private_photos;
create policy "Acces prive uniquement au proprietaire" on private_photos
  for all using (auth.uid() = owner)
  with check (auth.uid() = owner);


-- 3) NOUVEAU (V2) — Table des avis clients, partagés entre TOUS les visiteurs
create table if not exists reviews (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  type text,
  rating int not null check (rating between 1 and 5),
  comment text not null,
  created_at timestamptz default now()
);

alter table reviews enable row level security;

-- Tout le monde peut LIRE les avis (visiteurs du site)
drop policy if exists "Lecture publique avis" on reviews;
create policy "Lecture publique avis" on reviews
  for select using (true);

-- Tout le monde peut PUBLIER un avis (formulaire public, sans connexion)
drop policy if exists "Ajout public avis" on reviews;
create policy "Ajout public avis" on reviews
  for insert with check (true);

-- Seul le compte connecté (vous, depuis admin.html) peut supprimer un avis
drop policy if exists "Suppression connecte avis" on reviews;
create policy "Suppression connecte avis" on reviews
  for delete using (auth.role() = 'authenticated');


-- 4) Buckets de stockage des fichiers
insert into storage.buckets (id, name, public)
values ('gallery', 'gallery', true)
on conflict (id) do nothing;

insert into storage.buckets (id, name, public)
values ('private-work', 'private-work', false)
on conflict (id) do nothing;

drop policy if exists "Lecture publique fichiers galerie" on storage.objects;
create policy "Lecture publique fichiers galerie" on storage.objects
  for select using (bucket_id = 'gallery');

drop policy if exists "Ecriture connecte fichiers galerie" on storage.objects;
create policy "Ecriture connecte fichiers galerie" on storage.objects
  for insert with check (bucket_id = 'gallery' and auth.role() = 'authenticated');

drop policy if exists "Suppression connecte fichiers galerie" on storage.objects;
create policy "Suppression connecte fichiers galerie" on storage.objects
  for delete using (bucket_id = 'gallery' and auth.role() = 'authenticated');

drop policy if exists "Acces prive fichiers" on storage.objects;
create policy "Acces prive fichiers" on storage.objects
  for all using (bucket_id = 'private-work' and auth.role() = 'authenticated')
  with check (bucket_id = 'private-work' and auth.role() = 'authenticated');

-- ============================================================
-- Fin du script.
-- Si c'est votre première exécution : créez ensuite votre identifiant
-- de connexion (Authentication > Users > Add user) — voir SUPABASE_SETUP.md
-- Si vous aviez déjà tout configuré pour la V1 : la table "reviews"
-- vient d'être ajoutée, tout le reste (photos, comptes) est inchangé.
-- ============================================================
