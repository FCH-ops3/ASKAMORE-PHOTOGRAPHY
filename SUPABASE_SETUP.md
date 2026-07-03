# 🔐 Configurer votre espace privé (Supabase)

Ce site utilise **Supabase**, un service gratuit qui fournit la connexion (identifiant/mot de passe), le stockage des photos et la base de données. Comptez environ 15 minutes pour tout configurer, une seule fois.

## Étape 1 — Créer votre compte Supabase

1. Allez sur [supabase.com](https://supabase.com) et cliquez sur **Start your project**
2. Créez un compte (avec GitHub ou votre e-mail)
3. Cliquez sur **New project**
   - Nom : `askamore-photography`
   - Mot de passe de base de données : choisissez-en un solide et **notez-le quelque part** (vous n'en aurez normalement pas besoin au quotidien, mais gardez-le de côté)
   - Région : choisissez `West EU (Paris/London)` pour la meilleure vitesse depuis la France
4. Cliquez sur **Create new project** et patientez 1 à 2 minutes que le projet se crée

## Étape 2 — Exécuter le script de configuration

1. Dans le menu de gauche, cliquez sur **SQL Editor**
2. Cliquez sur **New query**
3. Ouvrez le fichier `setup.sql` (fourni avec ce site), copiez tout son contenu, et collez-le dans l'éditeur
4. Cliquez sur **Run** (ou Ctrl/Cmd + Entrée)
5. Vous devriez voir "Success. No rows returned" — c'est normal, cela signifie que les tables et les espaces de stockage ont bien été créés

## Étape 3 — Récupérer vos clés d'API

1. Dans le menu de gauche, allez dans **Project Settings** (icône ⚙️) → **API**
2. Notez ces deux informations :
   - **Project URL** (ressemble à `https://abcdefgh.supabase.co`)
   - **anon public key** (une longue chaîne de caractères)

## Étape 4 — Brancher ces clés dans le site

Dans **chacun** de ces fichiers : `index.html`, `mariage.html`, `fiancailles.html`, `gender-reveal.html`, `seance-photo.html`, `admin.html` — cherchez ces deux lignes (via Ctrl/Cmd+F dans l'éditeur GitHub) :

```js
const SUPABASE_URL = 'https://VOTRE-PROJET.supabase.co';
const SUPABASE_ANON_KEY = 'VOTRE_CLE_ANON_PUBLIC';
```

Et remplacez les valeurs par les vôtres récupérées à l'étape 3. Faites **Commit changes** à chaque fois.

> 💡 Astuce : envoyez-moi vos deux clés et je peux faire ce remplacement dans tous les fichiers d'un coup.

## Étape 5 — Créer votre identifiant de connexion

1. Dans Supabase, menu de gauche → **Authentication** → **Users**
2. Cliquez sur **Add user** → **Create new user**
3. Entrez l'e-mail et le mot de passe que vous (Flavie et Gokan) utiliserez pour vous connecter sur `admin.html`
   - Vous pouvez créer un seul compte partagé, ou un compte chacun (répétez l'opération)
4. Cochez **Auto Confirm User** pour ne pas avoir besoin de valider par e-mail

## Étape 6 — Se connecter

Allez sur `https://fch-ops3.github.io/ASKAMORE-PHOTOGRAPHY/admin.html`, connectez-vous avec l'e-mail/mot de passe créé à l'étape 5.

Vous pouvez maintenant :
- **Ajouter une photo à la galerie publique** → elle apparaît automatiquement sur le site, dans la bonne catégorie
- **Ajouter des photos à votre espace privé** → stockage perso, jamais visible par les visiteurs, organisable par dossier/client

## 🔒 Sécurité — ce qu'il faut savoir

- La page `admin.html` n'est **pas indexée** par Google et pas mise en avant dans le menu du site, mais l'URL reste techniquement accessible à qui la connaît. Sans identifiant/mot de passe valides, personne ne peut se connecter ni voir votre espace privé.
- Ne partagez vos identifiants de connexion qu'avec les personnes de confiance (vous deux).
- La clé "anon public" n'est pas un secret à cacher — elle est faite pour être visible dans le code, la sécurité réelle vient des règles d'accès (RLS) définies dans `setup.sql`, qui empêchent toute personne non connectée de modifier quoi que ce soit ou de voir votre espace privé.

## 💰 Coût

Le plan gratuit Supabase inclut 500 Mo de base de données et 1 Go de stockage fichiers, largement suffisant pour démarrer. Vous serez prévenus avant tout passage à un plan payant si un jour vous en avez besoin.
