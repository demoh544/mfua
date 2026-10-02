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
