# CLAUDE.md — Portfolio IA
> Fichier de contexte principal. À lire en premier à chaque nouvelle session Claude Code.
> Dernière mise à jour : 13 avril 2026 (session 2)

---

## Contexte projet
Site portfolio de Matthieu Duval — Senior PM, Nantes.
Objectif : démontrer une maîtrise concrète et opérationnelle de l'IA générative à destination de CPO / Head of Product en scale-up.
Message principal : "Je suis formé à l'IA gen et je peux embarquer une équipe."

---

## Déploiement et infrastructure

| Élément | Valeur |
|---------|--------|
| **URL live** | https://matthieu-duval.com/ |
| **URL workers.dev** | https://portfolio-ia.matthieu-duval1104.workers.dev/ (secondaire, toujours active) |
| **Repo GitHub** | https://github.com/matthieuduval1104-blip/portfolio-ia |
| **Branche principale** | `main` |
| **Déploiement** | Automatique via Cloudflare Workers → chaque `git push` sur `main` déclenche un build |
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
| `index.html` | Page d'accueil — hero 2 colonnes, grille 7 UC, CTA LinkedIn + CV | ✅ |
| `cafe-cot-rag.html` | UC01 — Méthodes CAFÉ, CoT & RAG (4 tabs) | ✅ |
| `agent-coach.html` | UC02 — Agent Coach PM (4 tabs) | ✅ |
| `pipeline-offres.html` | UC03 — Auto. Offres Make + Airtable (4 tabs) | ✅ |
| `agent-veille.html` | UC04 — Agent Veille PM (4 tabs) | ✅ |
| `umami.html` | UC05 — UMAMI site client festival fermentation (4 tabs) | ✅ |
| `agent-monitor.html` | UC06 — Agent Monitor audit prod F/P/S/C (4 tabs) | ✅ |
| `agent-factory.html` | UC07 — Agent Factory CLI 6 phases (4 tabs) | ✅ |
| `styles.css` | CSS centralisé (partagé par toutes les pages) | ✅ |
| `UC4/index.html` | Book (méta-cas) — orphelin, plus dans la nav | Archive |
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
| `../02_Profil-CV/Profil_Matthieu.md` | Profil complet |
| `../Agent_Coach_System_Prompt.md` | System prompt Agent Coach |

---

## Stack technique
- HTML/CSS statique, JS inline minimal (tabs + scroll-top + burger mobile)
- CSS centralisé dans `styles.css` (aucun `<style>` inline dans les HTML)
- Font : Satoshi via Fontshare CDN
- Déploiement : GitHub → Cloudflare Workers (auto-build sur push)

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
- Hero index pitch (`hero-cover-pitch`) : 17px, color `#555555`
- Hero index sub (`hero-cover-sub`) : 17px, color `#555555`

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

## État actuel des pages (13/04/2026 — session 2)

**index.html** :
- Grille 7 UCs (01→07), Factory en wide card (dernière)
- Nav 7 liens : CAFÉ CoT RAG / Agent Coach / Auto. Offres / Agent Veille / UMAMI / Monitor / Factory
- Book retiré de la nav et de la grille (UC4/index.html reste en archive)
- Hero pitch : "J'ai piloté des produits du Fooding au SaaS B2B chez R3." (verbe actif)
- Tracking Umami complet : 7 UC cards + 2 hero CTAs + 2 mobile nav + 2 footer

**cafe-cot-rag.html (UC01)** :
- Eyebrow : "Use case 01 · Formation GenAI"
- Hero pitch en première personne active
- Stats : "9/10 avec CoT · 7/10 sans", "95% hit rate RAG · vs 30% ChatGPT sans RAG"
- "dual-LLM" → "orchestration à deux modèles"
- 4 tabs : Multi-LLM · CAFÉ · CoT · RAG — tous trackés Umami

**agent-coach.html (UC02)** :
- Eyebrow : "Use case 02 · Formation GenAI"
- Stats : "6 Modes", "13 Sections de profil RAG documentées", "4 Candidatures jan-fév 2026"
- Meta/og mis à jour : "13 sections" (cohérent avec stat affichée)
- 4 tabs : Simulation fit · 6 modes · Analyse d'offre · Dashboard — tous trackés Umami

**pipeline-offres.html (UC03)** :
- Eyebrow : "Use case 03"
- Stats : "3 Sources", "3 Scénarios Make", "10 min / semaine"
- 4 tabs : Problème / Architecture / Décisions produit / En usage — tous trackés Umami

**agent-veille.html (UC04)** :
- Eyebrow : "Use case 04"
- Hero pitch restructuré : "Chaque lundi à 10h, un agent scanne..." (impersonnel → actif)
- Référence "(UC2)" supprimée → "l'Agent Coach"
- Stats : "18 Sources · <10 min de lecture", "6 Sections", "0 min Production manuelle"
- 4 tabs : Objectifs / Construction / System prompt / Décisions produit — tous trackés Umami

**umami.html (UC05)** :
- Hero pitch : "Conçu, développé et déployé entièrement avec Claude Code en 10 jours."
- Stats : "0 Dépendance technique · client autonome"
- Accord "image mal cadrée" corrigé
- 4 tabs : Contexte / Construction / Décisions / Live — tous trackés Umami

**agent-monitor.html (UC06)** :
- Hero pitch en première personne : "J'ai construit un agent qui audite..."
- F/P/S/C explicité dans le pitch : "(Fonctionnel / Précis / Stable / Couvrant)"
- Stats : "90–91% Scores mesurés", "4 Critères F/P/S/C", "O/N Validation humaine"
- 4 tabs : Problème / Architecture / Scoring / Décisions — tous trackés Umami

**agent-factory.html (UC07)** :
- Hero pitch : "chemins figés, années codées en dur" (jargon technique supprimé)
- "skippable" → "facultative" (×3)
- "paths hardcodés" → "chemins figés / chemins de fichiers figés" (partout)
- Stats : "6 phases", "3 fichiers générés", "0 Doc oubliée · Phase 6 en finally"
- 4 tabs : Problème / 6 phases / Anti-patterns / Décisions — tous trackés Umami

---

### CSS — nettoyage session 1 (13/04/2026)
- Suppression ~60 lignes de CSS mort : `.hero-tools-block`, `.tools-row`, `.tool-chip`, `.hero-tagline`, `.hero-divider`, blocs UC GRID index, résidus mobile désactivés
- Ajout `.content-label` (remplace l'inline style dans agent-veille.html)
- Commentaires de sections mis à jour (UC3-spécifique → générique)

---

## Projets liés

### Agent Veille PM (projet séparé)
- **Dossier** : `~/Desktop/Claud.projets/Produit/Veille-IA/`
- **Fichiers clés** : `veille_pm.py`, `notion_publisher.py`, `system_prompt_veille_v5.md`
- **Déclenchement** : alias `veille-pm` dans `~/.zshrc` OU cron lundi 10h
- **Stack** : Python 3, API Anthropic (claude-sonnet-4-6, web_search), API Notion
- **Premier run prod** : 22/02/2026 — 18 sources, 1680 mots, ~0.04€
- **Voir** : `Veille-IA/CLAUDE_agent_veille_v3.md` pour l'architecture complète
