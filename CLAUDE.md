# CLAUDE.md — Portfolio IA
> Fichier de contexte principal. À lire en premier à chaque nouvelle session Claude Code.
> Dernière mise à jour : 22 février 2026

---

## Contexte projet
Site portfolio de Matthieu Duval — Senior PM, Nantes.
Objectif : démontrer une maîtrise concrète et opérationnelle de l'IA générative à destination de CPO / Head of Product en scale-up.
Message principal : "Je suis formé à l'IA gen et je peux embarquer une équipe."

---

## Déploiement et infrastructure

| Élément | Valeur |
|---------|--------|
| **URL live** | https://book-matthieu-duval.netlify.app/ |
| **Repo GitHub** | https://github.com/matthieuduval1104-blip/portfolio-ia |
| **Branche principale** | `main` |
| **Déploiement** | Automatique via Netlify → chaque `git push` sur `main` déclenche un build |
| **Clé SSH** | `~/.ssh/id_ed25519_github` (ajoutée au compte GitHub le 22/02/2026) |

### Commande de déploiement standard
```
git add [fichiers] && git commit -m "description" && git push
```

### Si SSH non chargé (session terminal redémarrée)
```
ssh-add ~/.ssh/id_ed25519_github
```

---

## Structure du site

| Fichier | Page | Statut |
|---------|------|--------|
| `index.html` | Page d'accueil — hero 2 colonnes, grille 4 UC, CTA LinkedIn + CV | ✅ |
| `cafe-cot-rag.html` | UC1 — Méthodes CAFÉ, CoT & RAG (4 case studies en tabs) | ✅ |
| `agent-coach.html` | UC2 — Agent Coach PM (4 case studies en tabs) | ✅ |
| `agent-veille.html` | UC3 — Agent de Veille PM (4 tabs, CSS centralisé) | ✅ |
| `UC4/index.html` | UC4 — Ce portfolio (méta-cas, 4 tabs) | ✅ |
| `styles.css` | CSS centralisé (partagé par toutes les pages) | ✅ |
| `ce-portfolio.html` | Source Agent Coach pour UC4 — **ne pas modifier, ne pas déployer** | Archive |
| `OLD/` | Anciennes versions archivées — **ne pas toucher** | Archive |

---

## Méthode de travail
- **Agent Coach (Claude Sonnet)** dans claude.ai : itérations visuelles et contenu sur des HTML self-contained (CSS embarqué). Toutes les décisions design et éditoriales s'y prennent.
- **Claude Code** : intégration dans le projet, extraction CSS vers `styles.css`, cohérence entre les pages, maintenance du CLAUDE.md.

**Règle absolue** : le contenu se prépare dans Claude.ai → Claude Code intègre. On ne touche jamais directement au HTML pour du contenu éditorial.

---

## Contraintes non négociables
- Design brutaliste : noir/blanc + accent vert sauge `#4A7C59`, typographie forte, aéré, sans images
- Mobile first (breakpoint 768px)
- Ne rien inventer : uniquement ce qui est documenté et réel
- Lisible en 5 minutes
- Nav : "Agent Veille" (sans "de") sur toutes les pages
- Zéro CSS inline dans les fichiers HTML — tout dans `styles.css`
- Tous les liens externes (LinkedIn, CV, Notion, dashboard) : `target="_blank"`

---

## Fichiers clés

| Fichier | Contenu |
|---------|---------|
| `styles.css` | CSS unique centralisé — toutes les pages y font référence |
| `CV_MATTHIEU_DUVAL_Fevrier_2026.pdf` | CV téléchargeable (CTA index.html) |
| `GUIDE.md` | Guide de maintenance pour Matthieu (non-technique) |
| `UC4/CLAUDE.md` | Documentation complète des phases de construction UC4 |
| `UC4/JOURNAL_UC4.md` | Journal de bord détaillé de toutes les sessions |
| `../Profil_Matthieu.md` | Profil complet |
| `../Agent_Coach_System_Prompt.md` | System prompt Agent Coach |

---

## Stack technique
- HTML/CSS statique, JS inline minimal (tabs + scroll-top + burger mobile)
- CSS centralisé dans `styles.css` (aucun `<style>` inline dans les HTML)
- Font : Satoshi via Fontshare CDN
- Déploiement : GitHub → Netlify (auto-build sur push)

---

## Design System

### Palette
- Background : `#FFFFFF`
- Texte principal : `#0A0A0A`
- Texte secondaire : `#AAAAAA`
- Texte corps : `#555555`
- Bordures / séparateurs : `#E8E8E8`
- Accent (tabs actifs, learning border) : `#4A7C59` (vert sauge)
- Accent liens / hover : `#0A0A0A` souligné ou →

### Typographie
- Font principale : **Satoshi** (Fontshare CDN, weights 400-900)
- Titres H1 UC : clamp(44px, 4.5vw, 68px), font-weight 900, letter-spacing -2.5px, uppercase
- Titres H1 index : clamp(24px, 2.6vw, 40px), font-weight 900, letter-spacing -1.5px, uppercase
- Case titles : clamp(28px, 2.8vw, 40px), font-weight 900
- Labels / nav : 11px, font-weight 600, uppercase, letter-spacing 2px
- Body : 15px, font-weight 400, line-height 1.6

### Layout
- Max container : 1200px, centré
- Padding horizontal : 48px desktop / 24px mobile
- Grille use cases (index) : 2 colonnes desktop / 1 colonne mobile
- Cases UC : 2 colonnes (visual + content), alternance gauche/droite

### Navigation desktop
- Position : sticky top, z-index 10
- Style : fond blanc, bordure bottom 1px `#E8E8E8`
- Structure : `nav > .nav-inner` (max-width 1200px, centré)
- Items : uppercase, 11px, letter-spacing 2px
- Mobile : nav-links masqués (`display: none`)

### Burger menu mobile (implémenté 22/02/2026)
- 2 fines barres (22px × 1.5px, gap 7px), visible uniquement en mobile
- Overlay plein écran blanc, slide depuis la droite (`translateX(100%)` → `translateX(0)`)
- 4 liens UC en typographie massive (36px, weight 900, uppercase, gris → noir au hover)
- Lien actif de la page courante en noir
- Croix `×` pour fermer (top-right)
- LinkedIn + CV en bas du panneau
- Body scroll bloqué pendant l'ouverture
- Classe d'activation : `.mobile-nav.open`
- JS inline dans chaque page (ajouté à l'IIFE existant)

### Système de tabs (UC1/UC2/UC3/UC4)
- Position : sticky sous la nav (top: 64px), z-index 9
- Séparateur : **border-top sur `.tabs`** (jamais border-bottom sur `.hero`) → séparateur full width
- Tab active : `border-bottom: 2px solid #4A7C59`, color `#0A0A0A`
- Cases masquées par défaut (`display: none`), `.case.active` → `display: grid`
- JS inline en bas de page (IIFE, vanilla JS)

### Composants case study
- `.case-visual` : fond `#0A0A0A`, numéro décoratif 140px en filigrane
- `.case-content` : padding 52px, flex column, border-left `#E8E8E8`
- `.case-learning` : border-left 2px `#4A7C59`, fond `#F7F7F7`, label "Ce que ça révèle"
- `.case-link` : uppercase 11px, border-bottom 1px, hover opacity 0.4, margin-top auto
- `.modes-grid` (UC2) : grille 2×3 des 6 modes, numéros en `#4A7C59`
- `.sections-grid` (UC3) : grille 2×2 des 6 sections de veille
- `.build-steps` (UC3/UC4) : liste verticale des étapes, badges outil (noir / vert)
- `.workflow-steps` (UC3/UC4) : liste verticale, numéros en `#4A7C59`
- `.decisions-list` (UC3/UC4) : décisions avec option choisie/rejetée + conséquence
- `.prompt-versions` (UC3) : bloc horizontal v1/v2-v3/v4, version active en vert sauge

### Footer
- Index : `footer-left` (span) + `footer-right` (div avec liens LinkedIn + CV)
- UC1/UC2/UC3/UC4 : `footer-left` (lien retour index) + `footer-right` (div avec liens LinkedIn + CV)

### Règles absolues
- Zéro image, zéro icône décorative
- Border-radius : 2px uniquement sur éléments interactifs
- Zéro shadow
- Zéro couleur hors palette

---

## Structure du fichier styles.css
```
/* RESET & BASE */
/* NAV */
/* HERO */                    — align-items: start par défaut
/* HERO INDEX */              — .page layout flex, h1 réduit, divider, pitch, ctas
/* UC GRID (INDEX) */
/* TABS */
/* CASE STUDIES */
/* CASE LEARNING */
/* CASE LINK */
/* UC3 — SECTIONS GRID */
/* UC3 — BUILD STEPS */
/* UC3 — WORKFLOW STEPS */
/* UC3 — DECISIONS */
/* UC3 — PROMPT VERSIONS */
/* MODES GRID */              — grille 2×3 UC2
/* FOOTER */
/* SCROLL TOP */
/* BURGER / MOBILE NAV */     — burger 2 barres + overlay plein écran
/* MOBILE */                  — @media (max-width: 768px)
```

---

## État actuel des pages (22/02/2026)

**index.html** :
- Titre : "Après 10+ ans de produit. / Intégration IA active." (2 lignes nowrap)
- H1 réduit : clamp(24px, 2.6vw, 40px)
- Divider vert sauge `#4A7C59`
- Nav non sticky (position: static via `.page nav`)
- Footer : LinkedIn + CV
- CTA CV : `download` + `target="_blank"`

**cafe-cot-rag.html (UC1)** :
- Eyebrow : "Use case 01 · AI Discipline"
- Hero align-items: start
- Stats : "vs 7/10 sans CoT", "9,5/10 requêtes vs 3/10 avec ChatGPT"
- 4 tabs : Multi-LLM · CAFÉ · CoT · RAG
- Blocs noirs : labels descriptifs (Orchestration, Structuration, Décomposition, Architecture)

**agent-coach.html (UC2)** :
- Eyebrow : "Use case 02 · AI Discipline"
- Hero align-items: start (suppression du `style="align-items: end"` le 22/02)
- Stats : "6 Modes", "364 Lignes de profil RAG", "4 Candidatures préparées jan-fév 2026"
- 4 tabs : Simulation fit · 6 modes · Analyse d'offre · Dashboard

**agent-veille.html (UC3)** :
- Eyebrow : "Use case 03" (sans "· AI Discipline" — supprimé le 22/02)
- Hero align-items: start
- Stats : "18 Sources scannées", "6 Sections", "0 min Production manuelle"
- 4 tabs : Objectifs / Construction / System prompt / Décisions produit
- Composants UC3 spécifiques dans styles.css
- Tab Objectifs : lien `Notion →` ajouté après "Ce que ça révèle" (23/02/2026)

**UC4/index.html** :
- Eyebrow : "Use case 04"
- Hero stats : 4 use cases / 2 outils IA / 100% décisions tracées
- 4 tabs : Conception / Industrialisation / Décisions produit / Le système complet
- Bloc Déploiement : mentionne GitHub → Netlify auto-build
- Typo "4 UC ciblés" corrigée (était "4 UC cibls" dans le source Coach)

---

## Projets liés

### Agent Veille PM (projet séparé)
- **Dossier** : `~/Desktop/Claud.projets/Produit/Veille-IA/`
- **Fichiers clés** : `veille_pm.py`, `notion_publisher.py`, `system_prompt_veille_v5.md`
- **Déclenchement** : alias `veille-pm` dans `~/.zshrc` OU cron lundi 10h
- **Stack** : Python 3, API Anthropic (claude-sonnet-4-6, web_search), API Notion
- **Premier run prod** : 22/02/2026 — 18 sources, 1680 mots, ~0.04€
- **Voir** : `Veille-IA/CLAUDE_agent_veille_v3.md` pour l'architecture complète
