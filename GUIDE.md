# Guide de maintenance du portfolio
> Pour modifier une page, ajouter un use case, ou mettre à jour le site.
> Dernière mise à jour : 22 février 2026

---

## Comment fonctionne le système

Le portfolio repose sur trois outils qui travaillent ensemble :

| Outil | Rôle | Quand l'utiliser |
|-------|------|-----------------|
| **Claude.ai** (Agent Coach) | Écrire et itérer sur le contenu, décider du design | Pour tout ce qui est éditorial |
| **Claude Code** (terminal) | Intégrer les fichiers dans le projet, maintenir la cohérence | Pour tout ce qui est technique |
| **Git + Netlify** | Publier le site en ligne automatiquement | Après chaque modification validée |

**La règle d'or :** on ne touche jamais aux fichiers HTML directement dans le terminal. Le contenu se prépare dans Claude.ai, puis Claude Code l'intègre.

---

## Cas 1 — Modifier le contenu d'une page existante

### Exemple : corriger un texte, changer une stat, reformuler une phrase

**Étape 1 — Ouvrir Claude.ai**
- Va sur [claude.ai](https://claude.ai) et ouvre le projet "Agent Coach"
- Dans le chat, demande la modification directement :
  *"Dans agent-veille.html, change la stat '18 sources' par '22 sources'"*

**Étape 2 — Récupérer le fichier modifié**
- L'Agent Coach va te produire un fichier HTML complet avec la modification
- Copie le contenu entier du fichier HTML

**Étape 3 — Ouvrir Claude Code**
- Lance Claude Code dans le terminal en tapant `claude` depuis le dossier Portfolio-IA :
```
cd ~/Desktop/Claud.projets/Produit/Portfolio-IA
claude
```
- Colle le HTML que tu as reçu et dis à Claude Code de l'intégrer :
  *"Voici la nouvelle version de agent-veille.html. Remplace le fichier existant, en veillant à ce que le CSS reste dans styles.css et non inline."*

**Étape 4 — Publier**
```
git add agent-veille.html
git commit -m "update: correction stat sources agent veille"
git push
```
Netlify redéploie automatiquement en 30 secondes.

---

## Cas 2 — Modifier le design (couleur, typo, espacement)

Toutes les règles visuelles sont dans **un seul fichier** : `styles.css`.

### Exemple : changer la couleur d'accent

**Étape 1 — Identifier la valeur à changer**
La couleur vert sauge est `#4A7C59` dans styles.css. Elle apparaît sur les tabs actifs et les bordures d'apprentissage.

**Étape 2 — Ouvrir Claude Code et demander la modification**
```
claude
```
*"Dans styles.css, remplace toutes les occurrences de #4A7C59 par #2D6A4F"*

**Étape 3 — Publier**
```
git add styles.css
git commit -m "design: changement couleur accent"
git push
```

> La modification s'applique automatiquement sur toutes les pages puisqu'elles partagent le même CSS.

---

## Cas 3 — Ajouter un nouveau use case (UC5, UC6...)

C'est le cas le plus complet. Il se déroule en 4 phases.

---

### Phase 1 — Construire le contenu avec l'Agent Coach (Claude.ai)

**Étape 1 — Préparer la matière**
Avant d'ouvrir Claude.ai, avoir en tête :
- Quel est le use case ? Qu'est-ce que tu as vraiment fait ?
- Quels sont les 3-4 angles à documenter (= les 4 tabs) ?
- Quels sont les chiffres réels (durée, nb d'itérations, résultats mesurables) ?
- Quelles décisions ont été prises ? Qu'est-ce qui a été rejeté et pourquoi ?

**Étape 2 — Lancer la session Coach**
Dans le projet Agent Coach sur Claude.ai, envoie un brief avec :
- Le contexte du use case
- Les fichiers de référence (colle le contenu de `agent-veille.html` comme modèle de design)
- La structure souhaitée (4 tabs, hero avec stats, etc.)
- Les contraintes : *"Même design que les autres pages. Zéro image. Palette noir/blanc/vert sauge #4A7C59. Satoshi. Brutaliste."*

**Étape 3 — Itérer**
L'Agent Coach produit un HTML self-contained (avec CSS inline). C'est normal à ce stade — Claude Code s'occupera de nettoyer ça ensuite. Itère sur le contenu jusqu'à validation complète.

---

### Phase 2 — Intégrer avec Claude Code

**Étape 1 — Créer le dossier si nécessaire**
Pour un UC5, créer un dossier `UC5/` dans Portfolio-IA.

**Étape 2 — Donner le fichier HTML à Claude Code**
Lance Claude Code :
```
claude
```
Puis :
*"Voici le HTML de UC5 produit par l'Agent Coach. Intègre-le dans le projet :
1. Crée le fichier UC5/index.html
2. Supprime le bloc `<style>` et remplace-le par `<link rel='stylesheet' href='../styles.css'>`
3. Si le HTML contient de nouveaux composants CSS absents de styles.css, extrait-les et ajoute-les à styles.css
4. Corrige les liens de navigation (le lien actif doit pointer vers `index.html`, les autres pages vers leurs chemins relatifs corrects)"*

**Étape 3 — Mettre à jour les autres pages**
Toutes les pages ont une navigation avec les liens vers les UC. Il faut ajouter le lien vers UC5 dans la nav de chaque page :
```
<a href="UC5/index.html">Nom du UC5</a>
```
Demande à Claude Code :
*"Ajoute le lien vers UC5 dans la navigation de toutes les pages (index.html, cafe-cot-rag.html, agent-coach.html, agent-veille.html, UC4/index.html)"*

**Étape 4 — Mettre à jour index.html**
La page d'accueil a une grille avec les 4 UC. Ajouter la carte UC5 dans la grille `.uc-grid`.

**Étape 5 — Vérifications**
Demande à Claude Code de vérifier :
*"Vérifie qu'aucun fichier HTML dans le dossier racine et les sous-dossiers UC n'a de CSS inline. Vérifie que tous les liens de navigation sont cohérents."*

---

### Phase 3 — Mettre à jour la documentation

**CLAUDE.md** (dans Portfolio-IA/) :
Mettre à jour la table des fichiers et l'état des pages. Claude Code peut le faire automatiquement.

---

### Phase 4 — Publier

```
git add index.html UC5/index.html cafe-cot-rag.html agent-coach.html agent-veille.html UC4/index.html styles.css CLAUDE.md
git commit -m "feat: UC5 — [nom du use case]"
git push
```

Netlify redéploie en 30 secondes. L'URL reste la même : `book-matthieu-duval.netlify.app`

---

## Référence rapide — Commandes git du quotidien

### Voir l'état des fichiers modifiés
```
git status
```

### Ajouter un fichier spécifique au commit
```
git add nom-du-fichier.html
```

### Ajouter plusieurs fichiers
```
git add fichier1.html fichier2.html styles.css
```

### Créer un commit
```
git commit -m "description courte de ce qui a changé"
```

### Publier sur Netlify
```
git push
```

### Tout en une commande (si tu as modifié des fichiers déjà connus de git)
```
git add -u && git commit -m "update: description" && git push
```

---

## En cas de problème

### "Je vois une page blanche ou le CSS ne charge pas"
Vérifier que le fichier HTML pointe bien vers `../styles.css` (pour les pages dans des sous-dossiers) ou `styles.css` (pour les pages à la racine).

### "Git me demande une authentification"
La clé SSH est configurée sur ce Mac. Si le terminal demande quand même un mot de passe :
```
ssh-add ~/.ssh/id_ed25519_github
```
Puis relancer le `git push`.

### "J'ai fait une erreur dans un fichier et je veux revenir en arrière"
Demander à Claude Code : *"Annule les modifications de [nom du fichier] et reviens à la dernière version commitée."*

---

## Structure du projet pour référence

```
Portfolio-IA/
├── index.html              ← Page d'accueil
├── cafe-cot-rag.html       ← UC1
├── agent-coach.html        ← UC2
├── agent-veille.html       ← UC3
├── styles.css              ← CSS de TOUT le site (ne pas dupliquer)
├── CLAUDE.md               ← Documentation technique pour Claude Code
├── GUIDE.md                ← Ce fichier
├── UC4/
│   └── index.html          ← UC4
├── CV_MATTHIEU_DUVAL_Fevrier_2026.pdf
└── OLD/                    ← Archives (ne pas toucher)
```

---

## Règles à ne jamais enfreindre

1. **Zéro CSS inline dans les HTML** — tout CSS va dans `styles.css`
2. **Ne rien inventer** — uniquement ce qui est documenté et réel
3. **Tester localement avant de pusher** — ouvrir le fichier HTML dans le navigateur
4. **Un commit = une modification logique** — pas tout en vrac
