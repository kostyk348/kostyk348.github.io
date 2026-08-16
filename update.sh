#!/usr/bin/env bash
# Обновление сайта из .eml-постов.
#   posts/*.eml  ->  content/posts/*.md (hugo)  ->  git push  ->  GitHub Pages
# Использование: ./update.sh [commit message]
set -euo pipefail

EMLBOX="${EMLBOX:-/home/lain/mime-os/target/release/emlbox}"
MSG="${1:-site: update from .eml posts}"

echo "== 1. экспорт .eml постов в Hugo content =="
"$EMLBOX" site hugo posts content

echo "== 2. git =="
git add -A
if git diff --cached --quiet; then
    echo "ничего не изменилось"
else
    git commit -m "$MSG"
    git push origin main
    echo "== 3. запушено — GitHub Actions собирает и публикует =="
fi
