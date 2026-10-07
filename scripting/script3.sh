#!/bin/sh
# Проверка числа на чётность
printf "Введи число: "
read n
if [ $((n % 2)) -eq 0 ]; then
  echo "$n - чётное"
else
  echo "$n - нечётное"
fi
