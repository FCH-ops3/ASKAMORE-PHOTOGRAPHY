-- ============================================================
-- ASKAMORE PHOTOGRAPHY — Configuration Supabase
-- À copier-coller dans Supabase > SQL Editor > New query > Run
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

-- Tout le monde peut LIRE la galerie publique (visiteurs du site)
create policy "Lecture publique galerie" on gallery_photos
  for select using (true);

-- Seuls les utilisateurs connectés (vous) peuvent ajouter/modifier/supprimer
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

-- Chacun ne voit / ne modifie que SES propres photos privées
create policy "Acces prive uniquement au proprietaire" on private_photos
  for all using (auth.uid() = owner)
  with check (auth.uid() = owner);


-- 3) Buckets de stockage des fichiers
insert into storage.buckets (id, name, public)
values ('gallery', 'gallery', true)
on conflict (id) do nothing;

insert into storage.buckets (id, name, public)
values ('private-work', 'private-work', false)
on conflict (id) do nothing;

-- Politique du bucket "gallery" : lecture publique, écriture réservée aux connectés
create policy "Lecture publique fichiers galerie" on storage.objects
  for select using (bucket_id = 'gallery');

create policy "Ecriture connecte fichiers galerie" on storage.objects
  for insert with check (bucket_id = 'gallery' and auth.role() = 'authenticated');

create policy "Suppression connecte fichiers galerie" on storage.objects
  for delete using (bucket_id = 'gallery' and auth.role() = 'authenticated');

-- Politique du bucket "private-work" : uniquement le propriétaire du fichier
create policy "Acces prive fichiers" on storage.objects
  for all using (bucket_id = 'private-work' and auth.role() = 'authenticated')
  with check (bucket_id = 'private-work' and auth.role() = 'authenticated');

-- ============================================================
-- Fin du script. Une fois exécuté sans erreur, passez à la
-- création de votre compte de connexion (voir SUPABASE_SETUP.md)
-- ============================================================
