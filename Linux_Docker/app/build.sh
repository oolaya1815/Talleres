app="my-python-app"
docker build -t ${app} .

docker run -p 3306:3306 \
--name mariadb \
-e MYSQL_ROOT_PASSWORD=1234 \
-v "$PWD"/db:/var/lib/mysql \
-d mariadb

docker run --name myphpadmin \
-d --link mariadb:db \
-p 8081:80 \
phpmyadmin/phpmyadmin

docker run --name app -d \
--link mariadb:db1 \
-p 8080:8080 \
-v "$PWD":/usr/src/myapp \
-w /usr/src/myapp ${app} \
python app.py
