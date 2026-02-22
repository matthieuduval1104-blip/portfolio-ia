# CLAUDE.md — Portfolio IA

## Contexte projet
Site portfolio de Matthieu Duval — Senior PM, Nantes.
Objectif : démontrer une maîtrise concrète et opérationnelle de l'IA générative à destination de CPO / Head of Product en scale-up.
Message principal : "Je suis formé à l'IA gen et je peux embarquer une équipe."

## Structure du site
| Fichier | Page | Statut |
|---------|------|--------|
| `index.html` | Page d'accueil — hero 2 colonnes, grille 4 UC, CTA LinkedIn + CV | ✅ |
| `cafe-cot-rag.html` | UC1 — Méthodes CAFÉ, CoT & RAG (4 case studies en tabs) | ✅ |
| `agent-coach.html` | UC2 — Agent Coach PM (4 case studies en tabs) | ✅ |
| `agent-veille.html` | UC3 — Agent de Veille PM (4 tabs, CSS centralisé) | ✅ |
| `UC4/index.html` | UC4 — Ce portfolio (méta-cas, 4 tabs) | ✅ |
| `styles.css` | CSS centralisé (partagé par toutes les pages) | ✅ |

## Méthode de travail
- **Agent coach (Claude Sonnet)** dans claude.ai : itérations visuelles et contenu sur des HTML self-contained (CSS embarqué). Toutes les décisions design et éditoriales s'y prennent.
- **Claude Code** : intégration dans le projet, extraction CSS vers `styles.css`, cohérence entre les pages, maintenance du CLAUDE.md.

## Contraintes non négociables
- Design brutaliste : noir/blanc + accent vert sauge, typographie forte, aéré, sans images
- Mobile first (breakpoint 768px)
- Ne rien inventer : uniquement ce qui est documenté et réel
- Lisible en 5 minutes
- Nav : "Agent veille" (sans "de") sur toutes les pages

## Fichiers clés
| Fichier | Contenu |
|---------|---------|
| `styles.css` | CSS unique centralisé — toutes les pages y font référence |
| `CV_MATTHIEU_DUVAL_Fevrier_2026.pdf` | CV téléchargeable (CTA index.html) |
| `OLD/` | Anciennes versions archivées |
| `../Profil_Matthieu.md` | Profil complet |
| `../Agent_Coach_System_Prompt.md` | System prompt Agent Coach |

## Stack technique
- HTML/CSS statique, JS inline minimal (tabs + scroll-top)
- CSS centralisé dans `styles.css` (aucun `<style>` inline dans les HTML)
- Font : Satoshi via Fontshare CDN
- Déploiement Netlify

## Design System

### Références visuelles
- Baptiste Glaymann : typographie bold tout caps, navigation plate, labels petites caps
- Aaronpoe : espacement généreux, minimalisme, fond blanc pur, font légère

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

### Navigation
- Position : sticky top, z-index 10
- Style : fond blanc, bordure bottom 1px `#E8E8E8`
- Structure : `nav > .nav-inner` (max-width 1200px, centré)
- Items : uppercase, 11px, letter-spacing 2px
- Mobile : nav-links masqués (`display: none`)

### Système de tabs (UC1/UC2)
- Position : sticky sous la nav (top: 64px), z-index 9
- Séparateur : **border-top sur `.tabs`** (jamais border-bottom sur `.hero`) → séparateur full width
- Structure : `.tabs > .tabs-inner` (max-width 1200px, centré)
- Boutons `.tab` : 11px uppercase, border-bottom 2px transparent
- Tab active : `border-bottom: 2px solid #4A7C59`, color `#0A0A0A`
- Cases masquées par défaut (`display: none`), `.case.active` → `display: grid`
- JS inline en bas de page (IIFE, vanilla JS)
- Tabs UC1 : Multi-LLM · CAFÉ · CoT · RAG
- Tabs UC2 : Simulation fit · 6 modes · Analyse d'offre · Dashboard

### Composants case study
- `.case-visual` : fond `#0A0A0A`, numéro décoratif 140px en filigrane
- `.case-visual` labels : format "Libellé descriptif · Détail" (ex: "Orchestration · Claude, Notion AI, Deepseek")
- `.case-content` : padding 52px, flex column, border-left `#E8E8E8`
- `.case-learning` : border-left 2px `#4A7C59`, fond `#F7F7F7`, border-radius 2px, label "Ce que ça révèle"
- `.case-link` : uppercase 11px, border-bottom 1px, hover opacity 0.4, margin-top auto
- `.modes-grid` (UC2 uniquement) : grille 2×3 des 6 modes, numéros en `#4A7C59`
- `.sections-grid` (UC3) : grille 2×2 des 6 sections de veille, rangs en `#4A7C59`
- `.build-steps` (UC3) : liste verticale des étapes de construction, badges outil (noir / vert)
- `.workflow-steps` (UC3) : liste verticale du workflow hebdomadaire, numéros en `#4A7C59`
- `.decisions-list` (UC3) : liste décisions avec option choisie/rejetée + consequence
- `.prompt-versions` (UC3) : bloc horizontal v1/v2-v3/v4, version active en vert sauge

### Footer
- Index : `footer-left` (span) + `footer-right` (div avec liens LinkedIn + CV)
- UC1/UC2 : `footer-left` (lien retour index) + `footer-right` (div avec liens LinkedIn + CV)

### Règles absolues
- Zéro image, zéro icône décorative
- Border-radius : 2px uniquement sur éléments interactifs (cards, tabs, learning blocks, scroll-top)
- Zéro shadow
- Zéro couleur hors palette ci-dessus

### Structure du fichier styles.css
```
/* RESET & BASE */            — reset, html, body, scroll-behavior
/* NAV */                     — nav sticky, nav-inner, brand, links
/* HERO */                    — hero grid UC (align-items: start par défaut)
/* HERO INDEX */              — .page layout flex, h1 réduit, divider, pitch, ctas
/* UC GRID (INDEX) */         — uc-grid, uc-card, uc-tag (vert sauge fond)
/* TABS */                    — tabs sticky (border-top, pas border-bottom sur hero)
/* CASE STUDIES */            — cases, case, case-visual, case-content
/* CASE LEARNING */           — case-learning block (label "Ce que ça révèle")
/* CASE LINK */               — case-link (margin-top auto)
/* UC3 — SECTIONS GRID */     — sections-grid 2×2, section-item, section-rank/name/desc
/* UC3 — BUILD STEPS */       — build-steps liste, build-step-tool (noir/vert), build-step-body
/* UC3 — WORKFLOW STEPS */    — workflow-steps liste, workflow-num (vert), workflow-text
/* UC3 — DECISIONS */         — decisions-list, decision-option (chosen/rejected), decision-consequence
/* UC3 — PROMPT VERSIONS */   — prompt-versions flex, prompt-v-num, active-v (vert)
/* MODES GRID */              — grille 2×3 des 6 modes UC2
/* FOOTER */                  — footer commun
/* SCROLL TOP */              — bouton scroll-top
/* MOBILE */                  — media query unique @media (max-width: 768px)
```

### État actuel des pages (22/02/2026)

**index.html** :
- Titre : "Après 10+ ans de produit. / Intégration IA active." (2 lignes nowrap)
- H1 réduit : clamp(24px, 2.6vw, 40px)
- Divider : vert sauge `#4A7C59` (pas noir)
- Footer : LinkedIn + CV (plus d'email)
- Nav non sticky (position: static via `.page nav`)

**cafe-cot-rag.html (UC1)** :
- Hero align-items: start (eyebrow aligné avec texte droit)
- Stats contextualisées : "vs 7/10 sans CoT", "9,5/10 requêtes vs 3/10 avec ChatGPT"
- Blocs noirs : labels descriptifs (Orchestration, Structuration, Décomposition, Architecture)
- Labels learning : "Ce que ça révèle"

**agent-coach.html (UC2)** :
- Hero align-items: end (inline style)
- Stats : "6 Modes", "364 Lignes de profil RAG", "4 Offres analysées"
- Tab "Sujets sensibles" supprimée → remplacée par "6 modes" (grille 2×3)
- Labels learning : "Ce que ça révèle"

**agent-veille.html (UC3)** ✅ :
- Hero align-items: start (défaut styles.css)
- Stats : "18 Sources scannées", "6 Sections", "0 min Production manuelle"
- 4 tabs : System prompt / Objectifs / Construction / Décisions produit
- Composants UC3 spécifiques : prompt-versions, sections-grid, build-steps, workflow-steps, decisions-list
- CSS 100% centralisé dans styles.css (zéro inline)
- Construit via Agent Coach (claude.ai) + Claude Code — premier run production 22/02/2026

**UC4/index.html** ✅ :
- Migré depuis ce-portfolio.html (produit par Agent Coach) — intégré 22/02/2026
- 4 tabs : Conception / Industrialisation / Décisions produit / Le système complet
- Stats hero : 4 use cases / 2 outils IA / 100% décisions tracées
- CSS 100% centralisé dans styles.css (zéro inline)
- Composants : build-steps, workflow-steps, decisions-list (partagés avec UC3)
- Typo corrigée : "4 UC ciblés" (vs "4 UC cibls" dans le source Coach)
