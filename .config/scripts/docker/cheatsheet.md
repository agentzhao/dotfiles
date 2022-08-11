## ubuntu

`docker build -f ubuntu.Dockerfile . -t agentzhao/ubuntu:latest`
`docker run -v ~/workspace:/home/zhao/workspace --name ubuntu -it imagename`

## Docker commands

Inspect container
`docker inspect containername`

Container Logs
`docker logs containername`

List all containers
`docker ps -a`

Stop containers
`docker stop containerid/name`

Remove container
`docker rm name`

Remove all stopped containers
`docker container prune`

List all images
`docker images`

Remove images
`docker rmi imagename`

Download image
`docker pull imagename`

## Running

Execute command in container
`docker exec containername cat /etc/hosts`

Detached mode
`docker run -d --name=container containername`

Attach to container
`docker attach name/id`

Interactive + Terminal
`docker run -it name/id`

Mapping port 80 to docker port 5000
`docker run -p 80:5000 name`

Volume Mapping
`docker run -v /datadiroutside:/dirincontainer containername`

Setting environment variables (check via docker inspect)
`docker run -e COLOR=green containername`

Override ENTRYPOINT
`docker run -entrypoint sleep2.0 containername 100`

## Docker images

```
FROM Image:tag

# Dependencies
RUN apt-get update
RUN apt-get install packages

COPY /sourcecode /folderincontainer

ENTRYPOINT ["sleep"]
CMD ["5"] #default
```

Building image with tag
`docker build Dockerfile -t agentzhao/imagename`

Push image to dockerhub
`docker push agentzhao/imagename`

See image layers
`docker history imagename`

## Network

Network (default bridge)
`docker run name --network=none/host`

```
docker network create \
  --driver bridge \
  --subnet 182.18.0.0/16
  networkname
```

List all networks
`docker network ls`

## Storage

Create Volume
`docker volume create volumename`

Mount volume (volumename can also be a path)
`docker run -v volumnname:/directoryincontainer containername`

```
docker run \
  --mount type=bind, source=/path, target=/path containername
```

## Remote docker engine

`docker -H=remote-docker-engine:1234`

## cgroups (control groups)

50% of cpu cores
`docker run --cpus=0.5 containername`

100MB of memory
`docker run --memory=100m containername`

## Swarm

Replicas of web server
`docker service create --replicas=3 --network frontend my-web-server`
