# Instalando Docker

Es recomendable instalar Docker desde el repositorio oficial de Docker, con lo cual nos aseguramos de tener la última versión. Debemos agregar una fuente de paquete, la clave GPG de Docker para que su descarga se realice sin problemas.

Actualizamos la lista de paquetes:

```
$ sudo apt update
```

Instalamos algunos requisitos previos para que el comando "apt" pueda usar paquetes mediante "HTTPS"

```
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

Como siguiente paso debemos agregar la clave GPG del repositorio oficial de Docker

```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Agregamos el repositorio de Docker para nuestra la versión de Ubuntu 18.04

```
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
```

Luego de esto debemos actualizar el sistema

```
$ sudo apt update
```

Aun cuando hemos realizado lo necesario para que se instale Docker desde el repositorio oficial, es necesario asegurarnos que se realice de esa manera

```
$ apt-cache policy docker-ce
```

Lo cual nos mostrara en pantalla lo siguiente si todo se ha realizado correctamente

```
docker-ce:
  Installed: (none)
  Candidate: 18.03.1~ce~3-0~ubuntu
  Version table:
     18.03.1~ce~3-0~ubuntu 500
        500 https://download.docker.com/linux/ubuntu bionic/stable amd64 Packages
```

Se puede notar que docker-ce no está instalado, pero tenemos el candidato por el repositorio oficial

El último paso por realizar es:

```
$ sudo apt install docker-ce
```

Podemos verificar si se ha instalado correctamente ejecutando

```
$ sudo systemctl status docker
```

Lo cual nos mostrara en pantalla lo siguiente

```
Output
● docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2018-07-05 15:08:39 UTC; 2min 55s ago
     Docs: https://docs.docker.com
 Main PID: 10096 (dockerd)
    Tasks: 16
   CGroup: /system.slice/docker.service
           ├─10096 /usr/bin/dockerd -H fd://
           └─10113 docker-containerd --config /var/run/docker/containerd/containerd.toml
 ```
 
 ### Seguridad en Docker
 
 Es recomendable que Docker se ejecute con usuario sin permisos de administrador, por lo que es necesario realizar el siguiente paso, para que el usuario actual se agregue al grupo de Docker y se ejecute sin problemas
 
 ```
 $ sudo usermod -aG docker ${USER}
 ```
