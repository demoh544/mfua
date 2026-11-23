Для удобства сносим старые контейнеры

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

Создаем структуру статичного сайта и делаем простой index.html
```
mkdir my-site && cd my-site && touch index.html && echo '<h1>Hello Docker!</h1>' > index.html
```
![](/images/apache/apache1.png)

В нутри дериктории запускаем установку и запуск apache
```
docker run -d \
  --name my-apache-site \
  -p 8081:80 \
  -v $(pwd):/usr/local/apache2/htdocs \
  httpd:alpine
```
![](/images/apache/apache2.png)

Проверяем результат по http://localhost:8081/

![](/images/apache/apache3.png)