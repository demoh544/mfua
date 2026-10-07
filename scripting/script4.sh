#!/bin/bash

PROJECT="my-project"

mkdir -p "$PROJECT/css" "$PROJECT/js"
touch "$PROJECT/index.html"
touch "$PROJECT/css/style.css"
touch "$PROJECT/js/script.js"

echo "Структура проекта '$PROJECT' создана!"
