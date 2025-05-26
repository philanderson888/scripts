# Docker Multi-Container Communication Demo

This project demonstrates how two Docker containers can communicate with each other:
- An input container that receives data via HTTP requests
- An output container that displays the received data

## How It Works

1. The input service (port 3000):
   - Receives GET requests with a `data` parameter
   - Forwards the data to the output service
   - Runs in its own container

2. The output service (port 3001):
   - Receives data from the input service
   - Displays the data on a web page
   - Runs in its own container

## Running the Application

### Using Docker Compose (Recommended)

```bash
docker-compose up
```

### Using Raw Docker Commands

1. Create a network:
```bash
docker network create app-network
```

2. Build and run the output service:
```bash
docker build -t output-service -f Dockerfile.output .
docker run -d --name output-service --network app-network -p 3001:3001 output-service
```

3. Build and run the input service:
```bash
docker build -t input-service -f Dockerfile.input .
docker run -d --name input-service --network app-network -p 3000:3000 -e OUTPUT_SERVICE_URL=http://output-service:3001 input-service
```

## Testing the Communication

1. Send data through the input service:
   - Visit http://localhost:3000/receive?data=hello-world
   - Or use curl: `curl "http://localhost:3000/receive?data=hello-world"`

2. View the result in the output service:
   - Visit http://localhost:3001

## Understanding Container Communication

- The containers communicate over a Docker network named `app-network`
- Each container runs its own Express.js server
- The input container forwards data to the output container using HTTP
- Docker's networking allows containers to reference each other by service name

## note that after a change we must use

```bash
docker compose up --build
```

to force a container rebuild