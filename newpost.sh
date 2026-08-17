#!/usr/bin/env bash
# Новый пост: пишется markdown-файл, скрипт делает всё остальное.
#
#   ./newpost.sh posts/my-post.md --title "Заголовок" --tags vita,retro
#
# Что происходит:
#   1. posts/my-post.md      -> posts/my-post.eml   (.eml-обёртка: метаданные+целостность)
#   2. posts/*.eml           -> content/posts/*.md  (экспорт для Hugo)
#   3. git push              -> GitHub Actions собирает и публикует
#
# Без .eml-обёртки: положи .md прямо в content/posts/ и запусти ./update.sh —
# Hugo соберёт и его. Обёртка нужна, если хочешь синк постов по почте/сети
# между устройствами и версионирование.
set -euo pipefail

EMLBOX="${EMLBOX:-/home/lain/mime-os/target/release/emlbox}"

if [ "$#" -lt 1 ]; then
    echo "usage: $0 <post.md> --title \"...\" [--tags a,b]" >&2
    exit 1
fi

MD="$1"
shift
if [[ "$MD" != *.md ]]; then
    echo "аргумент должен быть .md файлом" >&2
    exit 1
fi
EML="${MD%.md}.eml"

echo "== 1. $MD -> $EML (.eml-обёртка) =="
"$EMLBOX" site new "$EML" --src "$MD" "$@"

echo "== 2. экспорт + пуш =="
./update.sh "post: $(basename "$MD" .md)"
