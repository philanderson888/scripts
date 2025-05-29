# Docker Communication Demo

This project demonstrates Docker container communication in two configurations:

## Single Server Setup

A simple web server that receives and displays data.

### Running the Single Server

```bash
docker compose up
```

Access the server at http://localhost:3002

## Two Server Setup (Input/Output)

Two containers that communicate with each other:
- An input container that receives data via HTTP requests
- An output container that displays the received data

### Running the Two Server Setup

```bash
docker compose -f docker-compose.two-servers.yml up
```

### How It Works

1. The input service (port 3000):
   - Receives GET requests with a `data` parameter
   - Forwards the data to the output service
   - Runs in its own container

2. The output service (port 3001):
   - Receives data from the input service
   - Displays the data on a web page
   - Runs in its own container

## Testing the Applications

### Single Server
1. Visit http://localhost:3002
2. Send data using: http://localhost:3002/receive?data=hello-world
3. View the result at: http://localhost:3002/display

### Two Server Setup
1. Send data through the input service:
   - Visit http://localhost:3000/receive?data=hello-world
   - Or use curl: `curl "http://localhost:3000/receive?data=hello-world"`

2. View the result in the output service:
   - Visit http://localhost:3001

## Understanding Container Communication

- The containers communicate over Docker networks
- Each container runs its own Express.js server
- In the two-server setup, the input container forwards data to the output container using HTTP
- Docker's networking allows containers to reference each other by service name

## Kubernetes Deployment

### Prerequisites
- Minikube installed and running
- kubectl installed
- Docker installed

### Quick Deploy Script
Save this as `deploy.sh`:

```bash
#!/bin/bash

# Build Docker image
docker build -t web-server:latest .

# Load image into Minikube
minikube image load web-server:latest

# Remove existing deployment and service
kubectl delete deployment web-server
kubectl delete service web-server-service

# Apply Kubernetes configurations
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# Wait for deployment
kubectl rollout status deployment/web-server

# Forward port to access locally
kubectl port-forward service/web-server-service 3002:3002
```

Make it executable:
```bash
chmod +x deploy.sh
```

Run it:
```bash
./deploy.sh
```

### Manual Deployment Steps

1. Build the Docker image:
```bash
docker build -t web-server:latest .
```

2. Load the image into Minikube:
```bash
minikube image load web-server:latest
```

3. Deploy to Kubernetes:
```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

4. Forward the port:
```bash
kubectl port-forward service/web-server-service 3002:3002
```

### Access the Application
- Web browser: http://localhost:3002
- Send data: `curl "http://localhost:3002/receive?data=hello-world"`
- View data: `curl "http://localhost:3002/display"`

### Monitor Cluster Status
Run the status script:
```bash
./k8s/status.zsh
```

The script shows:
- Pod status and details
- Service information
- Port forwarding status
- Cluster information