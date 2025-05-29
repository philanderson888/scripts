#!/bin/zsh

echo "\n🔍 Checking Pod Status..."
kubectl get pods -o wide

echo "\n📊 Checking Service Status..."
kubectl get services

echo "\n🔎 Detailed Pod Information..."
kubectl describe pods -l app=web-server

echo "\n📡 Port Forwarding Status..."
kubectl get endpoints web-server-service

echo "\n🌐 Cluster Info..."
kubectl cluster-info
