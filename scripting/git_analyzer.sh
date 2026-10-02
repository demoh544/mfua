#!/usr/bin/env bash
set -euo pipefail

export LC_NUMERIC=en_US.UTF-8

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
BOLD='\033[1m'
NC='\033[0m'

if ! command -v curl >/dev/null 2>&1; then
    echo -e "${RED}Ошибка: утилита 'curl' не установлена.${NC}" >&2
    exit 1
fi

TARGET="${1:-.}"
REPO=""

if [ -d "$TARGET" ]; then
    if [ -d "$TARGET/.git" ]; then
        GIT_URL=$(git -C "$TARGET" config --get remote.origin.url 2>/dev/null || echo "")
        if [ -n "$GIT_URL" ]; then
            REPO=$(echo "$GIT_URL" | sed -E 's|.*github.com[:/]([^/]+/[^/.]+).*|\1|')
        else
            echo -e "${RED}Ошибка: в локальном репозитории не настроен remote origin.${NC}" >&2
            exit 1
        fi
    else
        echo -e "${RED}Ошибка: указанная папка не является git-репозиторием.${NC}" >&2
        exit 1
    fi
else
    REPO="$TARGET"
fi

API_URL="https://api.github.com/repos/${REPO}"
TMP_JSON=$(mktemp)
trap 'rm -f "$TMP_JSON"' EXIT

HTTP_CODE=$(curl -s -o "$TMP_JSON" -w "%{http_code}" \
    -H "Accept: application/vnd.github+json" \
    -A "bash-github-analyzer" \
    "$API_URL")

case "$HTTP_CODE" in
    200) ;;
    404)
        echo -e "${RED}Ошибка: репозиторий '$REPO' не найден на GitHub.${NC}" >&2
        exit 2
        ;;
    403)
        echo -e "${RED}Ошибка: превышен лимит запросов к GitHub API.${NC}" >&2
        echo -e "${YELLOW}Подождите час или используйте токен GITHUB_TOKEN.${NC}" >&2
        exit 3
        ;;
    *)
        echo -e "${RED}Ошибка API (HTTP $HTTP_CODE).${NC}" >&2
        exit 4
        ;;
esac

json_get() {
    local key="$1"
    tr -d '\n' < "$TMP_JSON" \
        | grep -o "\"${key}\"[[:space:]]*:[[:space:]]*\(\"[^\"]*\"\|[^,}]*\)" \
        | head -n1 \
        | sed -E "s/^\"${key}\"[[:space:]]*:[[:space:]]*//; s/^\"//; s/\"$//; s/[[:space:]]+$//"
}

NAME=$(json_get "full_name")
STARS_RAW=$(json_get "stargazers_count")
FORKS_RAW=$(json_get "forks_count")
ISSUES_RAW=$(json_get "open_issues_count")
PUSHED=$(json_get "pushed_at")

AUTHOR=$(tr -d '\n' < "$TMP_JSON" \
    | grep -o '"owner"[[:space:]]*:[[:space:]]*{[^}]*}' \
    | grep -o '"login"[[:space:]]*:[[:space:]]*"[^"]*"' \
    | head -n1 \
    | sed -E 's/.*"login"[[:space:]]*:[[:space:]]*"([^"]*)".*/\1/')

NAME=${NAME:-$REPO}
AUTHOR=${AUTHOR:-unknown}

fmt() {
    local n="$1"
    n=$(printf '%s' "$n" | tr -dc '0-9')
    [[ -z "$n" ]] && n=0
    printf "%'d" "$n" 2>/dev/null || echo "$n"
}

STARS_F=$(fmt "${STARS_RAW:-0}")
FORKS_F=$(fmt "${FORKS_RAW:-0}")
ISSUES_F=$(fmt "${ISSUES_RAW:-0}")
if (( ${ISSUES_RAW:-0} > 100 )); then
    ISSUES_COLOR="$RED"
else
    ISSUES_COLOR="$YELLOW"
fi

PUSH_TS=$(date -d "$PUSHED" +%s 2>/dev/null || echo 0)
NOW_TS=$(date +%s)

if (( PUSH_TS == 0 )); then
    ACTIVITY="Неизвестно"
    ACTIVITY_COLOR="$YELLOW"
    AGO="—"
else
    DIFF_H=$(( (NOW_TS - PUSH_TS) / 3600 ))

    if   (( DIFF_H < 24 ));    then ACTIVITY="Высокая";  ACTIVITY_COLOR="$GREEN"
    elif (( DIFF_H < 24*30 )); then ACTIVITY="Средняя";  ACTIVITY_COLOR="$YELLOW"
    else                            ACTIVITY="Низкая";   ACTIVITY_COLOR="$RED"
    fi

    if   (( DIFF_H < 1 ));     then AGO="только что"
    elif (( DIFF_H < 24 ));    then AGO="$DIFF_H ч. назад"
    elif (( DIFF_H < 24*30 )); then AGO="$(( DIFF_H / 24 )) дн. назад"
    else                            AGO="$(( DIFF_H / 24 / 30 )) мес. назад"
    fi
fi

echo -e "${BOLD}${BLUE}------------------------------------------------${NC}"
echo -e "${BOLD}${BLUE}  GitHub Repository Analyzer                    ${NC}"
echo -e "${BOLD}${BLUE}------------------------------------------------${NC}"
echo
printf "${MAGENTA}Репозиторий:${NC} ${BOLD}%s${NC}\n" "$NAME"
printf "${YELLOW}Звезды:${NC}       ${YELLOW}%-12s${NC}\n" "$STARS_F"
printf "${GREEN}Форки:${NC}        ${GREEN}%-12s${NC}\n" "$FORKS_F"
printf "${ISSUES_COLOR}Open Issues:${NC}  ${ISSUES_COLOR}%-12s${NC}\n" "$ISSUES_F"
printf "${CYAN}Автор:${NC}        ${CYAN}%s${NC}\n" "$AUTHOR"
printf "${ACTIVITY_COLOR}Активность:${NC}   ${ACTIVITY_COLOR}%s${NC} (обновлен %s)\n" "$ACTIVITY" "$AGO"
echo

