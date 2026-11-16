По необходимости сносим старые контейнеры 
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

### Устанавливаем adminer
```
docker run -d \
  --name adminer \
  -p 8084:8080 \
  adminer:latest
```

![](/images/adminer/adminer1.png)

Можно посмотреть работу по https://localhost:8084/
![](/images/adminer/adminer2.png)