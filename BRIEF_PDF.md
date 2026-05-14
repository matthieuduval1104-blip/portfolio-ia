# Brief — Générer pitch-infra.pdf

## Contexte

`pitch-infra.html` est une page de présentation standalone (CSS embarqué, police Satoshi via CDN Fontshare) conçue pour présenter l'infrastructure IA de Matthieu Duval à un Head of Product / CPO. Elle est sur la branche `claude/ai-infrastructure-presentation-stYuZ` du repo `portfolio-ia`.

## Objectif

Générer un PDF de cette page, optimisé pour lecture mobile (iPhone), propre et fidèle au rendu HTML.

## Ce que je veux

- **Fichier de sortie** : `pitch-infra.pdf`
- **Format** : A4 ou équivalent mobile (390px wide), peu importe du moment que le contenu est lisible
- **Rendu** : fidèle au HTML — police Satoshi chargée, couleurs correctes, pas de troncature
- **Destination** : même dossier que `pitch-infra.html`

## Instructions

1. Checkout de la branche : `git checkout claude/ai-infrastructure-presentation-stYuZ`
2. Générer le PDF depuis `pitch-infra.html` avec l'outil disponible sur ce Mac (puppeteer, wkhtmltopdf, Chrome headless, ou autre)
3. Vérifier que le PDF est lisible et complet (toutes les sections : header, stats, diagramme, 3 sections note, closing)
4. Nommer le fichier `pitch-infra.pdf` et le placer dans le dossier `portfolio-ia/`

## Contenu du fichier HTML

Structure de haut en bas :
- Header : "INFRA IA" + eyebrow + sous-titre
- Stats : 8 agents / 12 projets / 91% fiabilité
- Diagramme workflow : Second cerveau → Pipeline 8 agents → Monitoring
- 3 sections de note : Pipeline structuré / Monitoring / Second cerveau
- Closing : punchline + LinkedIn
- Footer : lien portfolio
