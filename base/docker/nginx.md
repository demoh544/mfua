# [Установка и использование докера](/base/docker/docker.md)
# Создание контейнера 
### Начинаем с чистово листа этими командами 

Просматриваем контейнеры
```
docker ps -a
```
![[images/nginx/nginx1.png]]

Останавливаем все контейнеры
```
docker stop $(docker ps -q)
```
![[images/nginx/nginx2.png]]

Удаляем все контейнеры 
```
docker container prune
```
![[images/nginx/nginx3.png]]

Проверяем удаление 
```
docker ps -a
```
![[images/nginx/nginx4.png]]
### Устанавливаем Nginx
Ищем нужный контейнер
```
docker search nginx
```
![[images/nginx/nginx5.png]]

Устанавливаем и запускаем нужный контейнер
```
docker run -d --name my-nginx -p 80:80 nginx
```
![[images/nginx/nginx6.png]]

Проверяем установку
```
docker ps -a
```
![[images/nginx/nginx7.png]]
# Котейнер Nginx

Проверяем работу контейнера 
```
curl http://localhost:80/
```
![[images/nginx/nginx8.png]]
Либо открываем в браузере http://localhost:80/

Просмотреть информацию о nginx
```
docker inspect nginx
```
![[images/nginx/nginx9.png]]

Логи контейнера
```
docker logs my-nginx
```
![[images/nginx/nginx10.png]]

Войти в контейнер
```
docker exec -it my-nginx /bin/bash
```
![[images/nginx/nginx11.png]]
# Устройство контейнера
Внутри контейнера linux debean, поэтому можно выполнять что угодно в рамках linux

Просмотреть версию и дистрибутив
```
cat /etc/os-release
```
![[images/nginx/nginx12.png]]

fastfetch тоже работает
```
apt update && apt install -y fastfetch
fastfetch
```
![[images/nginx/nginx13.png]]

Также можно установить эти утилиты, они здесь работают, но чем больше 
приложений тем больше возможностей для компроментации  
```
apt update && apt install -y htop inxi cmatrix hollywood caca-utils mc micro
```

Для редактированяи страници nginx можно отредактировать файл /usr/share/nginx/index.html любым редактором (редактор надо установить например vim)
```
apt install vim
vim /usr/share/nginx/html/index.html
```
![[images/nginx/nginx14.png]]