#!/bin/bash

read -p "Введите расширение (например txt): " ext

echo "Файлы с расширением .$ext:"
find . -name "*.$ext"
