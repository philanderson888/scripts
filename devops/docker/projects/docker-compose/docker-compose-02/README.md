# docker flask redis manually

runs a docker container manually using just pure docker commands, without docker compose, in order to show the contrast between the two

script to run

```bash
# Build the image
docker build -t flask-app-9001 .

# Create a custom network for isolation
docker network create flask-net-9001

# Run Redis container
docker run -d \
  --name redis-9001 \
  --network flask-net-9001 \
  redis:alpine

# Run Flask app container on port 9001
docker run -d \
  --name flask-9001 \
  --network flask-net-9001 \
  -p 9001:5000 \
  flask-app-9001
```

run in interactive mode

```bash
docker run -it --entrypoint /bin/sh flask-app-9001
# Inside the container
python app.py
```