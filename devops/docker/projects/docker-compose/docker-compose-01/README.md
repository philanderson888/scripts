# docker

## contents
- [docker](#docker)
  - [contents](#contents)
  - [docker compose](#docker-compose)
    - [getting started](#getting-started)
  - [view running in processes inside our docker container](#view-running-in-processes-inside-our-docker-container)


## docker compose

### getting started

https://docs.docker.com/compose/gettingstarted

```bash
mkdir composetest
cd composetest
```

create python app [app.py](composetest/app.py)

add [Dockerfile](composetest/Dockerfile)

add [compose.yaml](composetest/compose.yaml)

run with

```bash
docker compose up
```

view on localhost:8000

```bash
docker image ls
docker inspect <tag> or <id>
docker compose down
```

if we add `watch` in version 2 of compose.yaml then we see changes are watched for

## view running in processes inside our docker container

we can view processes inside our docker container

first have to connect to the running container and log into the shell there.

this is how we do it

```bash
docker compose exec web sh
```

we are now connected and can now run for example

```bash
ps aux
```

we can also see what is happening using 

```bash
docker ps
```

```
8f487d95eab6   composetest-web              "flask run --debug"      8 minutes ago    Up 8 minutes    8000/tcp, 0.0.0.0:9000->5000/tcp   composetest-web-1
```

