# Askamore Photography — Site vitrine V2

Refonte visuelle complète du site vitrine **Askamore Photography** (photographie de mariage, fiançailles, autres événements et séances photo, par Flavie &amp; Gökan).

## ✨ Ce qui change par rapport à la V1

- Direction artistique entièrement repensée : curseur personnalisé, grain photographique subtil, typographie surdimensionnée, révélations animées au scroll
- Galerie repensée façon "galerie d'art" : chaque photo est présentée dans un passe-partout blanc avec ombre portée, sans jamais être recadrée
- Visionneuse plein écran au clic sur une photo (flèches de navigation, fermeture au clavier)
- Page d'accueil restructurée en manifeste éditorial (grande citation, signature, chiffres clés)
- **Avis clients désormais partagés entre tous les visiteurs** (stockés dans Supabase, et non plus seulement dans le navigateur de la personne qui les poste)
- Modération des avis directement depuis l'espace admin
- Formulaire de contact toujours branché sur Formspree (envoi automatique par e-mail)

## 📁 Structure du site

```
askamore-site-v2/
├── index.html          → Page d'accueil
├── mariage.html         → Galerie Mariage
├── fiancailles.html     → Galerie Fiançailles
├── gender-reveal.html   → Galerie Autre événement
├── seance-photo.html    → Galerie Séance Photo
├── admin.html           → Espace privé (connexion, ajout photos, modération avis)
├── setup.sql            → Script de configuration Supabase
├── SUPABASE_SETUP.md    → Guide pas à pas
└── README.md
```

Chaque page est autonome (CSS et JS intégrés), aucune dépendance à gérer en dehors de Supabase et Formspree.

## 🔌 Réutiliser votre projet Supabase existant

Cette V2 utilise **le même projet Supabase** que la V1 (mêmes clés déjà branchées dans le code). Vos photos et vos identifiants de connexion existants fonctionnent donc immédiatement.

**Une seule chose à faire** : ouvrez `setup.sql` dans Supabase (SQL Editor → New query), collez-le entièrement, et cliquez sur **Run**. Ce script est conçu pour être rejoué sans risque même si vous l'aviez déjà exécuté — il ajoute uniquement la nouvelle table des avis clients partagés, sans toucher à vos photos existantes.

## 🚀 Mettre le site en ligne avec GitHub Pages

1. Créez un nouveau dépôt GitHub (ou réutilisez l'existant si vous remplacez la V1)
2. Uploadez tous les fichiers de ce dossier via **Add file → Upload files**
3. Allez dans **Settings → Pages**, sélectionnez la branche `main` et le dossier `/ (root)`, puis **Save**
4. Votre site sera en ligne à une adresse du type `https://votre-nom.github.io/votre-depot/`

## ✅ À faire avant la mise en ligne définitive

- [ ] Exécuter `setup.sql` dans Supabase (ajout de la table des avis)
- [ ] Ajouter vos vraies photos via `admin.html`
- [ ] Vérifier que le formulaire de contact envoie bien les e-mails (voir SUPABASE_SETUP.md)

## 🎨 Identité visuelle

- Couleurs : blanc, noir profond, beige, touche d'or discret
- Polices : Cormorant Garamond (titres, en italique) et Jost (texte courant, labels)
- Style : luxe, éditorial, sobre — inspiré des studios de photographie haut de gamme
