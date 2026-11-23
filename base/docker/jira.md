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

### Создаем и запускаем контейнер

```
docker run -d --name jira -p 2990:8080 atlassian/jira-software:latest
```
![](/images/jira/jira1.png)

Во время установки можно запустить просмотр логов чтобы проверить идет ли процесс (у меня установка заняла 1 минуту)
```
docker logs -f jira
```
![](/images/jira/jira2.png)

Jira готов к работе

Проверяем результат по http://localost:2990

![](/images/jira/jira3.png)