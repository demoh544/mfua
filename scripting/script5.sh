#!/bin/bash

read -p "Введите имя файла: " file

if [ -f "$file" ]; then
	count=$(wc -l < "$file")
	echo "В файле '$file' строк: $count"
else
	echo "Ошибка: файл '$file' не найден"
fi
