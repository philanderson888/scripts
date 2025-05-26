build

```bash
docker build --no-cache -t flask-app-9001 .
```

verify code in the container

```bash
docker run -it --entrypoint /bin/sh flask-app-9001
```