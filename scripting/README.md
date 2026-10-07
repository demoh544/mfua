## Git_analyzer
### Установка скрипта [git_analyzer](/scripting/git_analyzer.sh) 

Для установки потребуется утилита `curl`

И для использования скрипта нужно наделить его правами с помощью `chmod`
```shell
curl -O https://raw.githubusercontent.com/demoh544/mfua/refs/heads/main/scripting/git_analyzer.sh
chmod +x git_analyzer.sh
```
### Возможности
Скрипт [git_analyzer](/scripting/git_analyzer.sh) способен анализировать гит репозиторий и выводить его параметры такие как
- Название репозитория
- Звезды
- Форки
- Open Issues
- Автор 
- Активность
### Пример 

Запуск скрипта
```bash
bash git_analyzer.sh ~/путь_до_репозитория
```
Вывод скрипта

![Вывод](/images/img_2.png)

## Простые скрипты
### script1
Вы вводите свое имя и скрипт его выдает

![Вывод](/images/script1.png)
### script2
Выводит сумму двух чисел

![Вывод](/images/script2.png)
### script3
Вы вводите число а скрипт выводит четное оно или нет

![Вывод](/images/script3.png)
### script4
Создает структуру веб-приложения

![Вывод](/images/script4.png)
### script5 
Вы вводите файл а скрипт выводит количество строк в файле

![Вывод](/images/script5.png)
### script6 
Создает простой пароль из восьми символов

![Вывод](/images/script6.png)
### script7 
Вы вводите расширение файла а скрипт выдает все файлы с этим расширением

![Вывод](/images/script7.png)