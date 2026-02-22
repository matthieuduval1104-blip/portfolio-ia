# JOURNAL UC4 — Ce portfolio
> Journal de bord complet de la construction du portfolio IA de Matthieu Duval.
> Mis à jour après chaque session de travail.

---

## Sessions — chronologie

---

### Sessions 1-3 — Conception (17-18 février 2026)
**Outil** : Claude (Sonnet 4.5) via claude.ai (Agent Coach)

#### UC1 — CAFÉ, CoT & RAG
- V1 rejetée : grilles/cards style Notion, trop générique, pas d'impact recruteur
- Pivot vers DA brutaliste inspirée de portfolios créatifs (mode, design)
- Principes retenus : chiffres massifs en blanc sur fond noir, alternance gauche/droite, bloc "Ce que ça révèle"
- Multi-LLM repositionné en case 01 (méta-compétence, frame les autres)
- Setup multi-LLM (capture d'écran Matthieu) : Claude Architect → Notion AI Executor → Deepseek Critique

**Chiffres clés UC1** :
- 2× : 2 formats de CR, zéro retouche manuelle (CAFÉ)
- +2 pts : 7/10 → 9/10 avec CoT
- 9,5/10 requêtes vs 3/10 avec ChatGPT (RAG)

#### UC2 — Agent Coach
- Même erreur initiale (grilles 3×2) → même pivot vers 4 case studies
- Chiffres qualitatifs assumés (pas de benchmarks comme UC1)
- Tab "Sujets sensibles" supprimée (expose des faiblesses dans un portfolio public)
- Remplacée par tab "6 modes" avec grille 2×3
- Dashboard ajouté comme case 4 (outil complémentaire hors LLM)

#### Index
- Layout 2 colonnes : pitch + CTA à gauche, grille 4 UC à droite
- Single viewport sur desktop (tout visible sans scroll)
- Titre : "Après 10+ ans de produit. / Intégration IA active."

#### Décisions transversales
- CTAs Notion supprimés sur UC2 (sortie du portfolio = perte d'attention)
- Footer différencié : index = LinkedIn + CV / UC = idem avec retour index
- Nav uniformisée sur toutes les pages

---

### Session 4 — Centralisation CSS (Claude Code, 18 février 2026)
**Outil** : Claude Code CLI

**Problème** : 3 fichiers HTML avec CSS inline dupliqué (~240 lignes chacun).

**Actions** :
1. Création de `styles.css` centralisé
2. Migration font Inter → **Satoshi** (Fontshare CDN)
3. Accent `#4A7C59` (vert sauge) ajouté sur tabs actifs et bordures learning
4. Harmonisation gris : `#999999` → `#AAAAAA`, bordures : `#E0E0E0` → `#E8E8E8`
5. Breakpoint unifié : 900px (UC1) + 768px (UC2) → **768px**
6. Ajout `.nav-inner` wrapper sur index
7. Ajout système de **tabs** sur UC1 et UC2 (sticky, JS vanilla IIFE)
8. Suppression de tout CSS inline des 3 HTML

---

### Sessions 5-6 — Itérations éditoriales et design (18-20 février 2026)
**Outil** : Agent Coach (claude.ai) → Claude Code pour intégration

**Décisions éditoriales** :
- Titre index : "Dix ans dans le digital" → "Après 10+ ans de produit. / Intégration IA active."
- Nav : "Agent de Veille" → "Agent veille"
- Labels learning : "Apprentissage clé" → "Ce que ça révèle"
- Stats UC1 contextualisées : "vs 7/10 sans CoT", "9,5/10 requêtes vs 3/10 avec ChatGPT"
- Stat UC2 : "v2.0 System prompt itéré" → "4 offres analysées"

**Décisions design** :
- Séparateur hero/tabs : border-bottom retiré du `.hero` → **border-top sur `.tabs`** (séparateur full width)
- Hero UC1 : align-items `end` → `start`
- H1 index : clamp(24px, 2.6vw, 40px), divider vert sauge
- Footer index : mail → LinkedIn + CV

---

### Session 7 — UC3 Agent Veille (22 février 2026, matin)
**Outil** : Claude Code CLI

**Contexte** : L'Agent Veille PM (Python) a été construit et mis en production le même jour. La page UC3 a été créée en parallèle via l'Agent Coach.

**Travail Agent Veille Python** (projet séparé, `Veille-IA/`) :
- Réécriture de `veille_pm.py` : suppression `--mode`, chargement system prompt depuis fichier externe, max_tokens=4000
- Réécriture de `notion_publisher.py` : callouts colorés 🥇🥈🥉, déduplication inter-runs
- Fix preamble leakage (texte de raisonnement Claude avant le contenu)
- Fix HTTP 400 (suppression blocs déjà archivés dans toggle)
- Alias `veille-pm` ajouté dans `~/.zshrc`
- **Premier run production** : 18 sources, 1680 mots, 105 blocs Notion, 1m49s, ~0.04€

**Travail portfolio UC3** :
- CSS UC3 extrait vers `styles.css` (5 nouveaux composants : sections-grid, build-steps, workflow-steps, decisions-list, prompt-versions)
- `agent-veille.html` migré : suppression ~130 lignes inline CSS, ajout `<link rel="stylesheet" href="styles.css">`
- CLAUDE.md mis à jour

---

### Session 8 — UC4 intégration + GitHub/Netlify (22 février 2026, après-midi)
**Outil** : Claude Code CLI

#### UC4/index.html
- Source : `ce-portfolio.html` (produit par Agent Coach — HTML self-contained avec CSS inline)
- Migration : suppression bloc `<style>` (183 lignes), ajout `<link rel="stylesheet" href="../styles.css">`
- Nav self-link corrigée : `../UC4/index.html` → `index.html`
- Typo corrigée : "4 UC cibls" → "4 UC ciblés"
- CSS : **zéro extraction nécessaire** — tout était déjà dans styles.css depuis UC3

#### Déploiement
- `git init` dans Portfolio-IA/
- `.gitignore` créé (`.DS_Store`, `*.log`)
- Premier commit : 9 fichiers (5 HTML prod, styles.css, CV, CLAUDE.md, .gitignore) — `OLD/` et `ce-portfolio.html` exclus
- Repo GitHub créé : `github.com/matthieuduval1104-blip/portfolio-ia`
- Authentification SSH (clé `~/.ssh/id_ed25519_github`, ajoutée à GitHub)
- Push initial + connexion Netlify → URL : `book-matthieu-duval.netlify.app`
- `GUIDE.md` créé (guide de maintenance non-technique)

---

### Session 9 — Burger menu mobile + corrections (22 février 2026, soir)
**Outil** : Claude Code CLI

#### Modifications contenu
- UC2 hero : suppression `style="align-items: end"` (eyebrow aligné avec description)
- UC3 eyebrow : "Use case 03 · AI Discipline" → "Use case 03"

#### Burger menu mobile (toutes les pages)
**Implémentation** :
- CSS : `.burger` (2 barres 22px × 1.5px, gap 7px) + `.mobile-nav` (overlay fixed plein écran)
- Slide depuis la droite : `translateX(100%)` → `translateX(0)` via classe `.open`
- 4 liens UC en 36px weight 900, gris → noir au hover, lien actif en noir
- Croix `×` pour fermer, body scroll bloqué pendant l'ouverture
- LinkedIn + CV en pied du panneau
- JS ajouté dans l'IIFE existant de chaque page
- Section CSS ajoutée dans styles.css avant `/* MOBILE */`

#### Liens externes
- `index.html` CTA CV : ajout `target="_blank"` (seul lien manquant)
- Tout le reste était déjà correct

#### UC4 contenu
- Bloc Déploiement (tab Industrialisation) : mention GitHub → Netlify auto-build

---

## Décisions permanentes (ne jamais revenir dessus sans validation)

| Décision | Choix | Rejeté | Raison |
|----------|-------|--------|--------|
| DA globale | Brutaliste, blocs noirs, chiffres massifs | Grilles Notion-like | Impact recruteur en 5 secondes |
| CSS | `styles.css` centralisé | CSS inline ×5 | Maintenabilité, cohérence |
| Font | Satoshi | Inter | Différenciation, caractère affirmé |
| Accent couleur | Vert sauge `#4A7C59` | Noir seul | Hiérarchie visuelle tabs/learning |
| Navigation cases | Tabs (1 case à la fois) | Scroll vertical | Focus lecture |
| Tab UC2 | "6 modes" | "Sujets sensibles" | N'expose pas de faiblesses |
| CTAs Notion sur UC2 | Supprimés | Présents | Sortie du portfolio = perte attention |
| Déploiement | GitHub → Netlify auto | Drag-and-drop | Push = deploy, zéro friction |

---

## État final du projet (22/02/2026)

### Ce qui est livré
- 5 pages HTML production, zéro CSS inline
- 1 `styles.css` centralisé (~520 lignes)
- Burger menu mobile sur toutes les pages
- Déploiement automatique GitHub → Netlify
- URL live : `book-matthieu-duval.netlify.app`

### Ce qui reste potentiellement à faire
- Repasse contenu UC2 : chiffres de résultat réels (nb candidatures préparées à mettre à jour)
- Tests mobile approfondis sur device réel
- Ajout éventuel d'un UC5 si nouvelle compétence à documenter

---

## Apprentissages process (réutilisables)

1. **Le binôme Agent Coach + Claude Code est le bon workflow** : Coach pour concevoir, Code pour industrialiser. Chacun dans son rôle.

2. **Le premier jet est toujours trop générique** : UC1 et UC2 ont démarré en grilles. Le pivot vers la DA distinctive est venu de la question "qu'est-ce qu'un recruteur retient en 5 secondes ?"

3. **Documenter les rejets vaut autant que documenter les choix** : chaque décision sans rejet explicité est une préférence, pas une décision.

4. **La centralisation CSS est un acte produit** : 3 fichiers avec des gris différents = incohérence perçue par l'utilisateur.

5. **Supprimer vaut mieux qu'ajouter** : Tab "Sujets sensibles" supprimée. Labels génériques remplacés. Chaque suppression améliore la clarté.

6. **Le méta-cas est le plus convaincant** : documenter la construction en temps réel prouve la capacité à piloter un projet IA de bout en bout.
