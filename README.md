# Askamore Photography — Site vitrine

Site vitrine pour **Askamore Photography**, photographie événementielle (mariage, fiançailles, gender reveal, autres événements) et séances photo.

## 📁 Structure du site

```
askamore-site/
├── index.html          → Page d'accueil
├── mariage.html         → Galerie Mariage
├── fiancailles.html     → Galerie Fiançailles
├── gender-reveal.html   → Galerie Gender Reveal & Autres événements
├── seance-photo.html    → Galerie Séance Photo
└── README.md
```

Chaque page est **autonome** (le design et les scripts sont intégrés directement dans le fichier), il n'y a donc aucune installation ni dépendance à gérer. Le site est en HTML/CSS/JS pur.

## 🚀 Mettre le site en ligne avec GitHub Pages (gratuit)

1. Créez un compte sur [github.com](https://github.com) si vous n'en avez pas
2. Cliquez sur **New repository** (bouton vert "New")
3. Donnez-lui un nom, par exemple `askamore-photography`, laissez-le en **Public**, puis cliquez sur **Create repository**
4. Sur la page du dépôt, cliquez sur **Add file → Upload files**
5. Glissez-déposez tous les fichiers de ce dossier (`index.html`, `mariage.html`, `fiancailles.html`, `gender-reveal.html`, `seance-photo.html`, `README.md`)
6. Cliquez sur **Commit changes**
7. Allez ensuite dans **Settings → Pages** (menu de gauche)
8. Dans **Branch**, choisissez `main` et le dossier `/ (root)`, puis **Save**
9. Après 1 à 2 minutes, votre site sera en ligne à une adresse du type :
   `https://votre-nom-utilisateur.github.io/askamore-photography/`

## 🔐 Espace privé & ajout de photos

Le site dispose maintenant d'une page de connexion (`admin.html`) réservée à Flavie et Gokan, permettant :
- D'ajouter des photos directement à la galerie publique (elles apparaissent automatiquement sur le site)
- De stocker tout le travail personnel dans un espace 100% privé, jamais visible par les visiteurs

**Configuration nécessaire (une seule fois)** : voir [`SUPABASE_SETUP.md`](./SUPABASE_SETUP.md), guide pas à pas (15 minutes, gratuit).

## 🗂️ Stocker tout votre travail (photos non publiées)

Avec l'espace privé (`admin.html`), vous pouvez maintenant stocker tout votre travail directement lié au site, avec identifiant/mot de passe, organisé par dossier/client. C'est privé, sécurisé, et accessible uniquement par vous deux.

## ✅ À faire avant la mise en ligne définitive

- [ ] Configurer Supabase en suivant `SUPABASE_SETUP.md`
- [ ] Créer votre identifiant de connexion et tester `admin.html`
- [ ] Ajouter vos premières vraies photos via l'espace privé
- [ ] Créer un compte [Formspree](https://formspree.io) et brancher l'URL du formulaire dans `index.html` pour que le formulaire de contact envoie automatiquement les e-mails (voir commentaire `⚠️ À REMPLACER` dans le code)
- [ ] Vérifier les coordonnées de contact (téléphone, e-mail, Instagram, TikTok)
- [ ] Envisager un nom de domaine personnalisé (ex: askamorephotography.fr) branché sur GitHub Pages si vous le souhaitez

## ✏️ Modifier le contenu

Chaque fichier `.html` peut être ouvert et modifié avec n'importe quel éditeur de texte (Bloc-notes, VS Code...). Le texte visible sur le site se trouve directement dans le fichier, entre les balises HTML.

## 🎨 Identité visuelle

- Couleurs : blanc, noir, beige
- Polices : Cormorant Garamond (titres) et Jost (texte courant)
- Style : moderne, élégant, professionnel
