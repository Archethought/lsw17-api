Commands from the talk

### Docker Installation Linux
```
sh install-docker.sh
```

### Installer explained
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
```

### Other platforms
Docker for Mac
https://www.docker.com/docker-mac

Docker for Windows
https://www.docker.com/docker-windows


### Retrieve a Docker image
```
docker pull tiangolo/uwsgi-nginx-flask:flask-upload
```

### Get the Code
```
git clone https://github.com/Archethought/lsw17-api
git clone https://github.com/peterfinlan/Sedna
```

### Copy site into codebase and deploy
```
cp -R Sedna/* lsw17-api/app/static
cd lsw17-api
sh deploy.sh
```

### Deploy explained
```
#!/bin/bash

dockerName=api
port=8886
logging=syslog
host_share=/home/cownby/api/app
container_share=/app

docker stop $dockerName;
docker rm $dockerName;
docker rmi $dockerName;
docker build --no-cache=true -t $dockerName .;
docker run -d --name $dockerName -p $port:80 --log-driver $logging -v ${host_share}:${container_share}  $dockerName
```

### The Dockerfile
```
FROM tiangolo/uwsgi-nginx-flask:flask-upload

COPY ./app /app
```
