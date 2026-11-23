### Останавливаем контейнеры

```
docker stop $(docker ps -q)
```
![](/images/prune/prune1.png)

И удалаем их

```
docker container prune
```
![](/images/prune/prune2.png) 
![](/images/prune/prune3.png)

### Создание контейнера

При запуске контейнера можно сразу задать пароль и email
```
docker run -d \
  --name libredb-studio \
  -p 3000:3000 \
  -e ADMIN_EMAIL=admin@example.com \
  -e ADMIN_PASSWORD=YourStrongPassword \
  -e JWT_SECRET=your-random-32-char-secret-string \
  ghcr.io/libredb/libredb-studio:latest
```
![](/images/libredb-studio/libredb-studio1.png)

Работу можно проверить по http://localhost:3000
![](/images/libredb-studio/libredb-studio2.png)
![](/images/libredb-studio/libredb-studio3.png)