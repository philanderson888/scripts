# Kubernetes and Helm Hello World

This project demonstrates how to deploy a simple "Hello World" application to a local Kubernetes cluster using either plain Kubernetes or Helm.

## Prerequisites

- Docker Desktop installed on your Mac
- Kubernetes enabled in Docker Desktop
- (Optional) Helm for the Helm deployment method

## Deployment Options

You can deploy this application using either plain Kubernetes or Helm. Choose the method that best suits your needs.

### Option 1: Plain Kubernetes Deployment

This method uses standard Kubernetes manifests without Helm.

1. Run the deployment script:
```bash
./kubernetes-deploy.sh
```

2. Access the application at:
   - Web browser: http://localhost:30081
   - Or using curl: `curl http://localhost:30081`

3. To clean up:
```bash
kubectl delete namespace hello-world
```

### Option 2: Helm Deployment

This method uses Helm to manage the deployment.

1. Install Helm if not already installed:
```bash
brew install helm
```

2. Run the Helm deployment script:
```bash
./build.sh
```

3. Access the application at:
   - Web browser: http://localhost:30080
   - Or using curl: `curl http://localhost:30080`

4. To clean up:
```bash
helm uninstall hello-world -n hello-world
kubectl delete namespace hello-world
```

## Project Structure

```
.
├── kubernetes/              # Plain Kubernetes manifests
│   ├── configmap.yaml
│   ├── deployment.yaml
│   └── service.yaml
├── hello-world-chart/      # Helm chart files
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
├── kubernetes-deploy.sh    # Script for Kubernetes deployment
└── build.sh               # Script for Helm deployment
```

## Deployment Details

- The application runs an Nginx server serving a static HTML page
- Both deployment methods expose the service via NodePort
- Kubernetes deployment uses port 30081
- Helm deployment uses port 30080
- The application includes basic health monitoring and resource limits

## Troubleshooting

If you encounter issues:

1. Verify Kubernetes is running:
```bash
kubectl cluster-info
```

2. Check pod status:
```bash
kubectl get pods -n hello-world
```

3. View pod logs:
```bash
kubectl logs <pod-name> -n hello-world
```

4. Check service status:
```bash
kubectl get services -n hello-world
```

## Next Steps

- Customize the HTML content in the ConfigMap
- Add monitoring and logging
- Implement rolling updates
- Add health checks and readiness probes