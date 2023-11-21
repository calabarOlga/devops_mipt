1. Создан nginx.Dockerfile, в конфиг nginx добавлена возможность запрета POST запросов `limit_except POST { deny all; }`. В качестве базового образа для nginx взят alpine (nginx:1.25.3-alpine-slim).  
Для запуска:  
`docker build -t nginx1253-alpine-slim -f nginx.Dockerfile .`  
`docker run -d -p 80:80 nginx1253-alpine-slim`  
2. Создан postgresql.Dockerfile, в качестве базового образа для postgresql взят официальный с сайта hub.docker.com (postgres:16.0-alpine). Сделано автоматическое создание пользователя test и пустой базы данных с тем же именем.  
Для запуска:  
`docker build -t postgres16-alpine -f postgresql.Dockerfile .`  
`docker run -d -p 5432:5432 postgres16-alpine`  
Для проверки юзера и БД было использовано следующее:  
`docker exec -it <container_id> psql -U test`, где <container_id> - id контейнера  
<img src="/img/db_full.jpg" alt="list_of_db" style="height: 300px; width:150px;"/>  
`SELECT datname FROM pg_database WHERE datistemplate = false;` для пользовательских БД  
<img src="/img/db_user.jpg" alt="list_of_db_user" style="height: 300px; width:150px;"/>  
<img src="/img/user.jpg" alt="user" style="height: 300px; width:150px;"/>  