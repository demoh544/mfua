### Установка скрипта [git_analazer](git_analazer.sh) 

Для установки потребуется утилита `curl`
И для использования скрипта нужно наделить его правами с помощью `chmod`
```shell
chmod +x git_analazer.sh
curl -O https://github.com/demoh544/mfua/scripting/git_analazer.sh
```
### Возможности
Скрипт [git_analazer](git_analazer.sh) способен анализировать гит репозиторий и выводить его параметры такие как
- Название репозитория
- Звезды
- Форки
- Open Issues
- Автор 
- Активность
## Пример 

Запуск скрипта
```bash
bash git_analazer.sh ~/путь_до_репозитория
```
Вывод скрипта
![Вывод скрипта](images/img_2)
