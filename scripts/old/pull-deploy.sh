#!/bin/bash
set -euo pipefail

PROJECT_DIR="/c/AAnother/PycharmProjects/DASI/DASI"
REPO="ghcr.io/commin4u"
SERVICES=("auth" "inventory" "order")

cd "$PROJECT_DIR"

echo "Pulling latest changes from GitHub..."
git fetch origin
git checkout main
git reset --hard origin/main

echo "Building Docker images locally..."
for service in "${SERVICES[@]}"; do
  echo "Building $service..."
  docker build -t $REPO/${service}-service:latest ./$service
done

echo "Applying Kubernetes manifests..."
kubectl apply -f kubernetes/

echo "Done. All services deployed to Kubernetes."
