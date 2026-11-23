### Останавливаем все контейнеры 

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

### Создаем контейнер

Создаем файл и рабочую дерикторию
```
mkdir HTTPserver && cd HTTPserver && touch test.txt && echo "Hello from HTTP server" > test.txt
```
![](/images/httpserver/httpserver1.png)

Запускаем контейнер в дериктории
```
docker run -d \
  --name http-server \
  -p 8082:80 \
  -v $(pwd):/usr/share/nginx/html \
  nginx:alpine
```
![](/images/httpserver/httpserver2.png)

Результат можно проверить по http://localhos8082/text.txt

![](/images/httpserver/httpserver3.png)