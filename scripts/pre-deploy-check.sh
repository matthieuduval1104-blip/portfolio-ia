#!/bin/bash
# pre-deploy-check.sh — Vérification automatique avant git push
# Portfolio IA — matthieu-duval.com
# Ordre nav de référence (mis à jour en session 2026-06-01)

set -e
PASS=0
FAIL=0
WARNINGS=()
ERRORS=()

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "════════════════════════════════════════"
echo "  PRE-DEPLOY CHECK — Portfolio IA"
echo "════════════════════════════════════════"
echo ""

# ── 1. Ordre nav de référence ──────────────────────────────────
# Ordre attendu sur toutes les pages (desktop + mobile)
EXPECTED_ORDER="infra-ia.html cafe-cot-rag.html umami.html agent-coach.html agent-veille.html pipeline-offres.html"

PAGES=(
  "index.html"
  "umami.html"
  "agent-coach.html"
  "agent-veille.html"
  "pipeline-offres.html"
  "cafe-cot-rag.html"
  "infra-ia.html"
)

echo "▸ Vérification ordre navigation (desktop + mobile)..."
echo ""

for page in "${PAGES[@]}"; do
  filepath="$DIR/$page"

  if [ ! -f "$filepath" ]; then
    ERRORS+=("$page : fichier introuvable")
    ((FAIL++))
    continue
  fi

  # Extraire l'ordre des hrefs dans nav-links (desktop)
  desktop_order=$(grep -A 10 'class="nav-links"' "$filepath" | grep -o 'href="[^"]*\.html"' | sed 's/href="//;s/"//' | tr '\n' ' ' | sed 's/ $//')
  mobile_order=$(grep -A 10 'class="mobile-nav-links"' "$filepath" | grep -o 'href="[^"]*\.html"' | sed 's/href="//;s/"//' | tr '\n' ' ' | sed 's/ $//')

  desktop_ok=true
  mobile_ok=true

  if [ "$desktop_order" != "$EXPECTED_ORDER" ]; then
    desktop_ok=false
  fi

  # index.html n'a pas de mobile nav
  if [ "$page" != "index.html" ] && [ "$mobile_order" != "$EXPECTED_ORDER" ]; then
    mobile_ok=false
  fi

  if $desktop_ok && $mobile_ok; then
    echo -e "  ${GREEN}✅${NC} $page — nav OK"
    ((PASS++))
  else
    if ! $desktop_ok; then
      ERRORS+=("$page — desktop nav incorrect : $desktop_order")
    fi
    if ! $mobile_ok; then
      ERRORS+=("$page — mobile nav incorrect : $mobile_order")
    fi
    echo -e "  ${RED}❌${NC} $page — nav incorrecte"
    ((FAIL++))
  fi
done

echo ""

# ── 2. Vérification hero index ─────────────────────────────────
echo "▸ Vérification structure hero (index.html)..."
echo ""

index="$DIR/index.html"

if grep -q 'class="hero-cover-narrative"' "$index" && \
   grep -q 'class="hero-cover-proof"' "$index" && \
   grep -q 'class="hero-cover-byline"' "$index"; then
  echo -e "  ${GREEN}✅${NC} index.html — structure hero (narrative + proof + byline) OK"
  ((PASS++))
else
  ERRORS+=("index.html — structure hero incorrecte (narrative/proof/byline manquant)")
  echo -e "  ${RED}❌${NC} index.html — structure hero incorrecte"
  ((FAIL++))
fi

# Vérifier que proof zone est bien HORS du hero-cover (frère dans .page)
hero_proof_in_hero=$(awk '/<section class="hero-cover">/,/<\/section>/' "$index" | grep -c 'hero-cover-proof' || true)
if [ "$hero_proof_in_hero" -eq 0 ]; then
  echo -e "  ${GREEN}✅${NC} index.html — proof zone hors du hero-cover OK"
  ((PASS++))
else
  ERRORS+=("index.html — proof zone imbriquée dans hero-cover (doit être un frère)")
  echo -e "  ${RED}❌${NC} index.html — proof zone mal positionnée"
  ((FAIL++))
fi

echo ""

# ── 3. Vérification classe active ─────────────────────────────
echo "▸ Vérification classe active (chaque page sur son propre lien)..."
echo ""

check_active() {
  local page="$1"
  local self="$2"
  local filepath="$DIR/$page"
  if grep -q "href=\"$self\" class=\"active\"" "$filepath"; then
    echo -e "  ${GREEN}✅${NC} $page — active sur $self OK"
    PASS=$((PASS+1))
  else
    ERRORS+=("$page — classe active manquante ou mal placée (attendu sur $self)")
    echo -e "  ${RED}❌${NC} $page — classe active incorrecte"
    FAIL=$((FAIL+1))
  fi
}

check_active "umami.html"          "umami.html"
check_active "agent-coach.html"    "agent-coach.html"
check_active "agent-veille.html"   "agent-veille.html"
check_active "pipeline-offres.html" "pipeline-offres.html"
check_active "cafe-cot-rag.html"   "cafe-cot-rag.html"
check_active "infra-ia.html"       "infra-ia.html"

echo ""

# ── Rapport final ──────────────────────────────────────────────
echo "════════════════════════════════════════"
echo ""

if [ ${#ERRORS[@]} -gt 0 ]; then
  echo -e "${RED}ERREURS DÉTECTÉES — push bloqué${NC}"
  echo ""
  for err in "${ERRORS[@]}"; do
    echo -e "  ${RED}✗${NC} $err"
  done
  echo ""
  echo -e "Résultat : ${GREEN}$PASS pass${NC} / ${RED}$FAIL fail${NC}"
  echo ""
  echo "Corrige les erreurs ci-dessus avant de pousser."
  echo ""
  exit 1
else
  echo -e "${GREEN}TOUTES LES VÉRIFICATIONS PASSENT — push autorisé${NC}"
  echo ""
  echo -e "Résultat : ${GREEN}$PASS pass${NC} / 0 fail"
  echo ""
  exit 0
fi
