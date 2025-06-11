#!/bin/bash

# Exit on error
set -e

echo "=== Helm Hello World Setup ==="
echo ""

echo check if docker desktop with kubernetes is installed
echo

if ! command -v kubectl &> /dev/null; then
    echo "kubectl not found. Please ensure Docker Desktop with Kubernetes is enabled."
    exit 1
fi

echo "✓ kubectl is installed"

echo
echo check if helm is installed 
echo

if ! command -v helm &> /dev/null; then
    echo "helm not found. Please install Helm using: brew install helm"
    brew install helm
    if ! command -v helm &> /dev/null; then
        echo "Failed to install Helm. Please install it manually."
        exit 1
    fi
fi

echo "Checking Kubernetes connection..."
if ! kubectl cluster-info &> /dev/null; then
    echo "Cannot connect to Kubernetes. Please ensure Kubernetes is enabled in Docker Desktop."
    exit 1
fi

echo
echo "✓ Kubernetes is running"
echo "✓ Helm is installed"
helm version
helm version --short
echo
echo "Checking Kubernetes context..."
current_context=$(kubectl config current-context)
if [ -z "$current_context" ]; then
    echo "No Kubernetes context is set. Please set a context using: kubectl config use-context <context-name>"
    exit 1
fi

echo
echo "Creating namespace 'hello-world'..."
kubectl create namespace hello-world 2>/dev/null || echo "Namespace hello-world already exists"
echo

echo
echo "Checking if Helm chart 'hello-world-chart' already exists..."
echo 

if [ ! -d "./hello-world-chart" ]; then
    echo "Creating Hello World Helm chart..."
    helm create hello-world-chart
    
    echo "Customizing Helm chart..."
    
    cat > hello-world-chart/values.yaml <<EOF
# Default values for hello-world-chart.
replicaCount: 1

image:
  repository: nginx
  pullPolicy: IfNotPresent
  tag: "stable"

service:
  type: NodePort
  port: 80
  nodePort: 30080

resources:
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 50m
    memory: 64Mi

# Custom app configuration
appConfig:
  message: "Hello, Kubernetes and Helm!"
EOF

    # Update configmap.yaml
    mkdir -p hello-world-chart/templates/configmap
    cat > hello-world-chart/templates/configmap/html.yaml <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-html-content
  labels:
    {{- include "hello-world-chart.labels" . | nindent 4 }}
data:
  index.html: |
    <!DOCTYPE html>
    <html>
    <head>
      <title>Hello from Kubernetes!</title>
      <style>
        body {
          font-family: Arial, sans-serif;
          background-color: #f4f4f4;
          color: #333;
          margin: 0;
          padding: 0;
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
        }
        .container {
          background-color: white;
          border-radius: 8px;
          box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
          padding: 40px;
          text-align: center;
          max-width: 600px;
        }
        h1 {
          color: #2266AA;
          margin-bottom: 20px;
        }
        p {
          font-size: 18px;
          line-height: 1.6;
        }
        .info {
          margin-top: 30px;
          font-size: 14px;
          color: #666;
        }
        .highlight {
          background-color: #f0f8ff;
          padding: 10px;
          border-radius: 4px;
          margin: 20px 0;
          font-family: monospace;
        }
      </style>
    </head>
    <body>
      <div class="container">
        <h1>{{ .Values.appConfig.message }}</h1>
        <p>Your Kubernetes cluster is running properly with Helm!</p>
        
        <div class="highlight">
          Release: {{ .Release.Name }}<br>
          Namespace: {{ .Release.Namespace }}
        </div>
        
        <div class="info">
          <p>This page is served by Nginx, deployed using Helm on Kubernetes.</p>
          <p>You can customize this message in the Helm values.yaml file.</p>
        </div>
      </div>
    </body>
    </html>
EOF

    # Update deployment.yaml to mount the configmap
    cat > hello-world-chart/templates/deployment.yaml <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "hello-world-chart.fullname" . }}
  labels:
    {{- include "hello-world-chart.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      {{- include "hello-world-chart.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      labels:
        {{- include "hello-world-chart.selectorLabels" . | nindent 8 }}
    spec:
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - name: http
              containerPort: 80
              protocol: TCP
          volumeMounts:
            - name: html-content
              mountPath: /usr/share/nginx/html
          resources:
            {{- toYaml .Values.resources | nindent 12 }}
      volumes:
        - name: html-content
          configMap:
            name: {{ .Release.Name }}-html-content
EOF

    # Update service.yaml to specify NodePort
    cat > hello-world-chart/templates/service.yaml <<EOF
apiVersion: v1
kind: Service
metadata:
  name: {{ include "hello-world-chart.fullname" . }}
  labels:
    {{- include "hello-world-chart.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
      {{- if and (eq .Values.service.type "NodePort") .Values.service.nodePort }}
      nodePort: {{ .Values.service.nodePort }}
      {{- end }}
  selector:
    {{- include "hello-world-chart.selectorLabels" . | nindent 4 }}
EOF

    echo "✓ Helm chart created and customized"
else
    echo "✓ Using existing Helm chart"
fi

echo ""
echo "Installing Helm chart..."
helm upgrade --install hello-world ./hello-world-chart --namespace hello-world

echo ""
echo "Waiting for deployment to be ready..."
kubectl wait --for=condition=available --timeout=60s deployment/hello-world-hello-world-chart -n hello-world

echo ""
echo "Deployment Status:"
kubectl get pods,services -n hello-world

echo ""
echo "==============================================="
echo "🎉 Success! Your Hello World app is deployed!"
echo "==============================================="
echo ""
echo "Access your application at: http://localhost:30080"
echo "Or use: curl http://localhost:30080"
echo ""
echo "To delete the application:"
echo "  helm uninstall hello-world -n hello-world"
echo "  kubectl delete namespace hello-world"