# TASK_LOG — Portfolio IA
> Mis à jour après chaque action. Source de vérité inter-sessions.
> Règle : toute modification de fichier ou décision → entrée ici immédiatement.

---

## Session 2026-05-04

### Décisions actées
- UC numbering définitif : cafe-cot-rag=UC01, infra-ia=UC02, agent-coach=UC03, pipeline-offres=UC04, agent-veille=UC05, umami=UC06
- agent-monitor.html + agent-factory.html : fusionnés dans infra-ia.html → remplacés par des redirects meta refresh → infra-ia.html
- Nav order (toutes pages) : UMAMI / Agent Coach / Agent Veille / Auto. Offres / CAFÉ CoT RAG / Infra IA
- Règle CV : `download` uniquement, pas de `target="_blank"`
- Règle LinkedIn : `target="_blank" rel="noopener noreferrer"` obligatoire
- Règle burger : `aria-expanded="false" aria-controls="mobileNav"` + JS toggle setAttribute

### Actions ✅ complétées

#### Revue 5 agents + corrections éditoriales
- `pipeline-offres.html` — revue complète ✅ (session précédente ou début session)
- `agent-veille.html` — revue complète ✅
- `umami.html` — revue complète ✅ (Learning Contexte supprimé, pitch réécrit, etc.)
- `agent-coach.html` — eyebrow UC02→UC03 + div→p ✅
- `cafe-cot-rag.html` — déjà correct (session précédente) ✅

#### Corrections UC numbering (eyebrows)
- `agent-coach.html` : "Use case 02" → "Use case 03" ✅
- `pipeline-offres.html` : "Use case 03" → "Use case 04" ✅
- `agent-veille.html` : "Use case 04" → "Use case 05" ✅
- `umami.html` : "Use case 05" → "Use case 06" ✅

#### Corrections infra-ia.html
- burger : aria-expanded + aria-controls ajoutés ✅
- mobile-nav-footer CV : target/_blank → download ✅
- hero-eyebrow : div → p ✅
- footer CV : target/_blank → download ✅
- burger JS : setAttribute aria-expanded true/false ✅

#### Corrections styles.css
- `.hero-pitch` color : #444444 → #555555 ✅

#### Nav order vérifiée OK sur
- cafe-cot-rag.html ✅
- agent-coach.html ✅
- pipeline-offres.html ✅
- agent-veille.html ✅
- umami.html ✅
- infra-ia.html ✅

### En cours — 2026-05-04

- [ ] agent-monitor.html → redirect meta refresh vers infra-ia.html
- [ ] agent-factory.html → redirect meta refresh vers infra-ia.html
- [ ] index.html : 7 UCs → 6 UCs + wording "7 use cases" → "6 use cases" + grille
- [ ] CLAUDE.md : mettre à jour structure UC (UC01→UC06, infra-ia, archiver monitor/factory)
- [ ] MEMORY.md : mettre à jour pages portfolio
- [ ] Commit + push (fichiers un par un)

### Pages NON revues 5-agents dans cette session
- `infra-ia.html` — page nouvelle, jamais passée en revue 5 agents
- `index.html` — pas encore retouché

---

## Sessions précédentes — résumé

### Session antérieure (date inconnue — avant compaction)
- Création de `infra-ia.html` (fusion UC06+UC07) ✅
- Nav de agent-monitor.html + agent-factory.html mise à jour (retrait liens Monitor/Factory, ajout Infra IA) — mais ordre INCORRECT (CAFÉ premier au lieu de UMAMI)
- Décision fusion NON documentée dans CLAUDE.md → bug de session détecté 2026-05-04

---

### Actions ✅ complétées — 2026-05-04 (suite)
- CLAUDE.md — règle TASK_LOG encodée en tête de fichier ✅
- TASK_LOG.md — créé et alimenté avec état complet session ✅
- umami.html eyebrow : "Use case 06" → "Use case 01" ✅
- agent-coach.html eyebrow : "Use case 03" → "Use case 02" ✅
- agent-veille.html eyebrow : "Use case 05" → "Use case 03" ✅
- cafe-cot-rag.html eyebrow : "Use case 01" → "Use case 05" ✅
- infra-ia.html eyebrow : "Use case 02" → "Use case 06" ✅
- pipeline-offres.html eyebrow : "Use case 04" → inchangé ✅
- index.html burger : aria-expanded + aria-controls ajoutés ✅
- index.html mobile-nav-footer CV : target="_blank" supprimé → download only ✅
- index.html footer CV : target="_blank" supprimé → download only ✅
- index.html burger JS : setAttribute aria-expanded true/false ajouté ✅
- agent-monitor.html : meta refresh redirect → infra-ia.html ajouté ✅
- agent-factory.html : meta refresh redirect → infra-ia.html ajouté ✅
- CLAUDE.md : structure 6 UCs mise à jour (numérotation définitive, monitor/factory archivés, règles CV/burger/eyebrow ajoutées) ✅
- MEMORY.md : pages portfolio mises à jour (6 UCs, ordre définitif, monitor/factory archivés) ✅
- Revue 5-agents : terminée ✅ — 11 corrections identifiées, 9 à appliquer (2 déjà faites — UC meta)
- cafe-cot-rag.html : em-dash meta → · ✅ / em-dash og:title → · ✅ / "(auto-évalué)" supprimé → "10 requêtes test" ✅
- infra-ia.html : og:image ajouté ✅ / "vraie" supprimé dans case-title ✅ / "Pas d'optimiser à tout prix" → "L'objectif est de comprendre, pas de rogner." ✅
- index.html : "Intégration GenAI" → "IA opérationnelle" ✅ / "Rien n'est théorique." supprimé ✅ / rel superflu sur CV supprimé ✅
- Régression cross-pages : 7/7 pages ✅ — PRÊT POUR COMMIT ✅
- Git commits : 6 commits individuels ✅ (infra-ia / redirects / 5 pages UC / index / styles / docs)
- Git push → Cloudflare auto-build ✅
- index.html hero sub : B2 appliqué + "Concret. Documenté." conservé + "En production." supprimé ✅
- index.html : uc-intro "Chaque cas a été conçu, buildé et mesuré." supprimée ✅
- Commit + push ✅
- CLAUDE.md : section "État actuel des pages" entièrement réécrite (session 3, UC01-06, état réel) ✅
- Meta descriptions UC : 5 fichiers mis à jour (café 01→05, umami 05→01, infra 02→06, veille 04→03, offres 03→04) ✅

### DÉCISIONS 2026-05-04
- agent-monitor.html + agent-factory.html → NE PAS corriger. Ajouter redirect meta refresh → infra-ia.html
- NUMÉROTATION UC DÉFINITIVE (confirmé Matthieu) : 01=UMAMI · 02=Agent Coach · 03=Agent Veille · 04=Auto. Offres · 05=CAFÉ CoT RAG · 06=Infra IA
- Eyebrows à corriger : umami (06→01) · agent-coach (03→02) · agent-veille (05→03) · café (01→05) · infra (02→06) · pipeline-offres (04→04, inchangé)
- Revue 5 agents + CPO recruteur à faire sur : cafe-cot-rag.html · index.html · infra-ia.html

### Reste à faire — dans cet ordre
1. Réponse Matthieu sur numérotation UC (A ou B) → avant de toucher quoi que ce soit sur les eyebrows
2. Repasse revue sur `cafe-cot-rag.html` (revue faite en session compactée, corrections à reverifier)
3. Repasse revue sur `index.html` (idem)
4. Repasse revue sur `infra-ia.html` (idem)
5. Redirect meta refresh → `agent-monitor.html` et `agent-factory.html`
6. Vérification régression complète cross-pages
7. Commit fichier par fichier
8. Push → Cloudflare auto-deploy

---

## Session 2026-05-07 — Personal OS · infra-ia.html

### Contexte
Remplacement du diagramme pipeline linéaire (tab Process) par un nouveau visuel "Personal OS".
Objectif : montrer l'intelligence d'activation contextuelle de l'équipe agents, pas juste un cycle de vie projet.

### Décisions actées
- Pipeline linéaire abandonné : montrait un cycle de vie classique, pas la valeur réelle du système (activation sélective)
- Nouveau concept : 3 mini-hubs côte à côte (CORRECTION / LIVRAISON / LANCEMENT) — même langage visuel hub, 3 états d'activation différents
- CSS : classes `diag-*` supprimées → remplacées par `os-*` (Personal OS)
- Preamble en 2 lignes avec `<br>` au point sémantique (contexte / bénéfice)
- Fichiers test créés mais non déployés (test_personal_os.html, test_options_ab.html, test_diagram_pipeline.html)

### Texte preamble validé (final)
> Tout brief n'appelle pas les mêmes compétences. Le PM lit le contexte, active les agents nécessaires et maintient les autres en réserve.
> Activer juste, c'est gagner en vélocité tout en maîtrisant sa consommation en tokens.

### Actions ✅ complétées
- `styles.css` : section `PIPELINE DIAGRAM — UC06` → `PERSONAL OS — UC06`, classes `diag-*` → `os-*` + `.os-preamble` ajouté ✅
- `infra-ia.html` : SVG pipeline linéaire remplacé par préambule + SVG 3 mini-hubs ✅
- `infra-ia.html` : em-dash dans aria-label corrigé (→ `:`) ✅
- `infra-ia.html` : pager sub-label `'Diagramme'` → `'Process'` dans `tabCaseLabels` ✅
- Git commit + push ✅ (e9dcfb2 — visuel + CSS)
- Git commit + push ✅ (c2e0980 — pager label)

### Agents impliqués dans cette session
- PM : arbitrage option A vs B, validation concept
- Copywriter : rédaction et itération du texte preamble (4 versions)
- Designer : specs visuelles hub, calcul positions ellipse, validation rendu
- Reviewer : vérification classes CSS, no inline styles, no em-dash
- QA : vérification tab JS inchangé, mobile overflow-x, aria-label
- Ops : commit + push

### Fichiers modifiés (committés)
- `infra-ia.html` — SVG linéaire remplacé, preamble ajouté
- `styles.css` — classes diag-* → os-* (17 classes remplacées)

### Fichiers test (non committés, à conserver localement)
- `test_personal_os.html` — hub & spoke + grille originale (abandonné)
- `test_options_ab.html` — options A (3 mini-hubs) et B (colonnes typo)
- `test_diagram_pipeline.html` — pipeline linéaire original (abandonné)

---

---

## Session 2026-05-20 — UC06 Infra IA · Ajout agent secu

### Actions ✅ complétées
- `infra-ia.html` : meta tags 8→9 agents ✅
- `infra-ia.html` : hero-stat-num 8→9 ✅
- `infra-ia.html` : SVG Personal OS redessiné 7→8 nodes (ajout SECU, actif en LANCEMENT uniquement) ✅
- `infra-ia.html` : CASE 01 -- paragraphe 1 mis à jour (9 agents, secu ajouté entre QA et ops) ✅
- `infra-ia.html` : CASE 01 -- case-impact-num 8→9 ✅
- `infra-ia.html` : CASE 01 -- paragraphe secu inséré avant case-learning ✅
- `infra-ia.html` : CASE 03 Sécurité inséré (id=case-0-3) ✅
- `infra-ia.html` : JS pager -- tabCases, allCaseIds, tabCaseLabels mis à jour ✅

### Vérifications ✅ passées
- Zéro CSS inline dans infra-ia.html ✅
- Zéro em-dash dans contenu visible ✅
- case-0-3 présent dans allCaseIds, tabCases[0] et tabCaseLabels[0] ✅
- SVG : 3 occurrences "SECU" (HUB1 off, HUB2 off, HUB3 on) ✅
- hero-stat-num contient "9" ✅

---

## Session 2026-05-28 — Hero index + LinkedIn post + Visuel

### Contexte
Refonte du hero index.html (disposition + copy) + création du post LinkedIn infra IA + visuel LinkedIn.

### Décisions actées
- Hero index : angle "infra IA" → second cerveau en premier, team produit ensuite, outputs en preuve
- Hero index : H1 sur 3 lignes (Senior PM. / Dix ans de produit. / Un pipeline de livraison IA.)
- Hero index : sous-paragraphe remplacé par grille 3 colonnes (Infrastructure / Production / Résultats)
- Hero index : disposition `justify-content: space-between` sur `.hero-cover` — zéro scroll sur la home
- LinkedIn post : structure 3 piliers (Second cerveau → Team Produit → Outputs)
- LinkedIn post : Team Produit = 11 agents (ajout Token — suivi coûts API)
- Visuel LinkedIn : pipeline vertical 3 couches (Second Cerveau noir / Team Produit gris / Outputs blanc)

### Actions ✅ complétées
- `index.html` : hero entièrement restructuré — H1 3 lignes, `.hero-cover-body`, `.hero-cover-pitch`, `.hero-cover-divider`, `.hero-cover-grid` (3 cols), `.hero-cover-ctas` ✅
- `styles.css` : nouvelles classes hero — `.hero-cover-body`, `.hero-cover-divider`, `.hero-cover-grid`, `.hero-cover-col-label`, `.hero-cover-col-text` + suppression `.hero-cover-foot`, `.hero-cover-sub` ✅
- Git commit + push ✅
- `outputs/20260528_linkedin-visual-A.html` : visuel LinkedIn créé (pipeline 3 couches, 1080×1080px) ✅
- `outputs/20260528_linkedin-visual-A.png` : export PNG via Playwright ✅

### Livrables LinkedIn (non committés — usage Matthieu)
- **Post LinkedIn** : texte final validé (voir ci-dessous)
- **Visuel** : `outputs/20260528_linkedin-visual-A.png`

### Texte post LinkedIn (version finale validée)
```
J'ai construit un pipeline de livraison IA avec Claude Code depuis janvier.
Pas une démo. En production.

Voilà comment ça fonctionne.

Un second cerveau d'abord. Chaque projet a ses fichiers organisés de façon prévisible : état d'avancement, règles immuables, historique des décisions. En parallèle, une base de connaissances à jour : les gens rencontrés, les échanges importants, les choix pris. Avant d'agir, chaque agent sait où chercher. Le système ne repart jamais de zéro.

Une Team Produit dessus. 11 agents spécialisés :
PM · cadrage et orchestration
Designer · DA et design tokens
Frontend · HTML/CSS/JS, composants
Backend · Python, APIs, scripts
Reviewer · qualité et conventions code
QA · tests et edge cases
Copywriter · textes, copy, naming
Ops · git et déploiement
Secu · audit sécurité avant chaque deploy
Status · santé du pipeline
Token · suivi des coûts API

Des jalons entre chaque étape. Chaque agent sait exactement ce qu'il doit livrer, et à qui.

Des outputs, enfin.

Un tableau de bord de veille financière, déployé chez un client en autonomie depuis plusieurs semaines.

7 agents Python en production, dont :
Veille PM · 18 sources agrégées chaque lundi, synthèse Notion automatique
Monitor · mesure la fiabilité de chaque agent en continu
Factory · guide CLI pour créer de nouveaux agents en 6 phases
Newsletter · newsletters Gmail transformées en base Notion structurée

Un site vitrine pour un festival, livré en 10 jours, zéro dépendance, client autonome.

matthieu-duval.com
```

### Fichiers supprimés (versions intermédiaires)
- `outputs/20260528_linkedin-visual.html` — version 1 (grille agents seule, abandonnée)
- `outputs/20260528_linkedin-visual.png`
- `outputs/20260528_linkedin-visual-B.html` — version B (hub-and-spoke, non retenue)
- `outputs/20260528_linkedin-visual-B.png`

---

## Règles de ce fichier
1. Toute modification de fichier HTML/CSS → ligne ✅ ajoutée ici immédiatement
2. Toute décision (architecture, contenu, process) → ligne "Décisions actées" immédiatement
3. Au démarrage de session → lire ce fichier EN PREMIER, avant CLAUDE.md
4. Ne jamais considérer une tâche comme "faite" si elle n'est pas ici
5. Jamais de batch : une action = une entrée = action suivante

---

## Session 2026-06-01

### Décisions actées
- Nouvel ordre nav définitif : Infra IA / CAFÉ CoT RAG / UMAMI / Agent Coach / Agent Veille / Auto. Offres
- Architecture hero index restructurée : proof zone sortie du hero-cover, devient frère direct dans .page
- Règle pre-deploy : reviewer + vérification automatique obligatoires avant tout git push

### Modifications fichiers
✅ index.html — redesign hero complet (zone narrative + zone proof séparées, CTAs byline, numérotation 01/02/03)
✅ index.html — nouvel ordre UC strip (01 Infra IA, 02 CAFÉ CoT RAG, 03 UMAMI, 04 Agent Coach, 05 Agent Veille, 06 Auto. Offres)
✅ index.html — nav desktop mise à jour (nouvel ordre)
✅ styles.css — refonte complète .hero-cover-* (narrative/proof séparés, byline, séparateurs EBEBEB, proof tint F7F7F5)
✅ styles.css — border UC strip allégée #0A0A0A → #D8D8D8
✅ umami.html — nav desktop + mobile mis à jour (nouvel ordre)
✅ agent-coach.html — nav desktop + mobile mis à jour (nouvel ordre)
✅ agent-veille.html — nav desktop + mobile mis à jour (nouvel ordre)
✅ pipeline-offres.html — nav desktop + mobile mis à jour (nouvel ordre)
✅ cafe-cot-rag.html — nav desktop + mobile mis à jour (nouvel ordre)
✅ infra-ia.html — nav desktop + mobile mis à jour (nouvel ordre)
✅ scripts/pre-deploy-check.sh — créé (vérification automatique nav + hero avant push)
✅ .git/hooks/pre-push — créé (bloque push si check échoue)

### Process déployé
- Avant tout git push : pre-deploy-check.sh vérifie automatiquement la cohérence nav sur toutes les pages
- Le reviewer agent inspecte les fichiers modifiés avant commit
- Anti-régression : l'ordre nav est la source de vérité dans CLAUDE.md

---

## Session 2026-06-01 (suite) — Déploiement case routing modèles

### Actions ✅ complétées
- `infra-ia.html` : case-1-4 "Routing modèles" ajoutée dans Tab Monitoring & coûts ✅
- pre-deploy-check.sh : 15/15 checks passés ✅
- git add infra-ia.html → commit 691ea01 ✅
- git push → Cloudflare auto-build déclenché ✅

### Commit
- Hash : 691ea01
- Message : "Ajoute case routing modèles (Haiku/Sonnet/Opus) dans Infra IA — Tab Monitoring & coûts"
- 1 fichier modifié, 27 insertions(+), 3 suppressions(-)

---

## Session 2026-06-01 — suite (pipeline Infra IA)

### Décisions actées
- Routing modèles (Haiku/Sonnet/Opus) ajouté comme nouvelle capacité documentée dans l'UC Infra IA
- Placement : Tab "Monitoring & coûts", case 04 (après Scores historisés)
- Premier pipeline complet avec routing modèles appliqué dès le départ
- Token-analyst flag : Secu en Opus = 46% du coût session — à arbitrer selon criticité

### Modifications fichiers
✅ infra-ia.html — ajout case-1-4 "Routing modèles" (HTML + JS : tabCases, allCaseIds, tabCaseLabels)

### Pipeline exécuté
PM → Copywriter (Sonnet) → Designer (Sonnet) → Frontend (Sonnet) → Reviewer (Sonnet, APPROVED) → QA (Sonnet, 5/5) → Secu (Opus, CLEAR) → Token-analyst (Haiku, $4.38 ref / 261K tokens) → Ops (Sonnet, 15/15 pre-deploy)

### Commit
691ea01 — infra-ia.html — 27 insertions, 3 suppressions

---

## Session 2026-06-09 — Context Engineering rename

### Décisions actées
- UC06 renommée "Infra IA" → "Context Engineering" (proposition contextengineering.fr — validée PM + Copywriter)
- Tab 1 UC06 : "Process" → "Personal OS"
- Pager sub-page 01 : "Process" → "Activation" (doublon "Personal OS/Personal OS" détecté en local)
- Hero pitch UC06 réécrit (Version A copywriter) : "Le context engineering, c'est décider ce que le modèle sait avant qu'il répond..."
- Nav order source de vérité mise à jour : Context Engineering en premier (09/06/2026)
- Bug préexistant corrigé : "dix agents" / "10 agents" → "neuf agents" / "9 agents" dans index.html (incohérence cross-pages détectée par PM lors de la repasse complète)
- Bug préexistant corrigé : nav mobile index.html dans le mauvais ordre (UMAMI en premier au lieu de Context Engineering)

### Modifications fichiers
✅ infra-ia.html — title, meta, OG, nav desktop+mobile, H1, hero pitch, tab "Personal OS", pager label "Activation"
✅ index.html — card UC06 title, nav mobile ordre, hero "neuf agents" / "9 agents"
✅ cafe-cot-rag.html — nav text uniquement
✅ umami.html — nav text uniquement
✅ agent-coach.html — nav text uniquement
✅ agent-veille.html — nav text uniquement
✅ pipeline-offres.html — nav text uniquement
✅ agent-monitor.html — nav text uniquement
✅ agent-factory.html — nav text uniquement
✅ CLAUDE.md — UC06 label, nav order source de vérité (09/06/2026)

### Pipeline exécuté
PM (analyse stratégique) → Copywriter (hero pitch V.A) → DA repasse ciblée (APPROVED) → PM repasse ciblée (APPROVED) → DA repasse complète (CHANGES REQUIRED : nav mobile + pager label) → PM repasse complète (APPROVED + bug "10 agents") → corrections appliquées → PM interpellé sur doublon Personal OS (reconnu, label "Activation" proposé) → correction → rendu local validé → Ops (15/15 pre-deploy, commit 93e2122, push)

### Commit
93e2122 — 9 fichiers, 30 insertions, 30 suppressions — live https://matthieu-duval.com/
