#!/bin/bash

# CI/CD script to deploy all microservices
# Pulls from GitHub, builds Gradle, creates Docker images, updates Kubernetes deployments

set -e

REPO_URL="https://github.com/commin4u/DASI.git"
BRANCH="develop"
BASE_DIR="/c/AAnother/PycharmProjects/DASI/DASI"
SERVICES=("auth" "inventory" "order")
KUBE_DIR="$BASE_DIR/kubernetes"

echo "[+] Starting deployment for all microservices..."

# Step 1: Pull latest code from GitHub
echo "[+] Pulling latest code from $REPO_URL (branch: $BRANCH)..."
cd "$BASE_DIR"
git fetch origin
git checkout "$BRANCH" || {
  echo "[+] Creating branch $BRANCH..."
  git checkout -b "$BRANCH"
}
git pull origin "$BRANCH" || {
  echo "[+] No upstream branch $BRANCH; will push new branch later."
}

# Step 2: Build each microservice with Gradle
for SERVICE in "${SERVICES[@]}"; do
  echo "[+] Building $SERVICE service..."
  cd "$BASE_DIR/$SERVICE"
  ./gradlew build -x test
  if [ $? -ne 0 ]; then
    echo "[!] Gradle build failed for $SERVICE."
    exit 1
  fi
done

# Step 3: Build Docker images
for SERVICE in "${SERVICES[@]}"; do
  echo "[+] Building Docker image for $SERVICE-service..."
  cd "$BASE_DIR/$SERVICE"
  docker build -t "$SERVICE-service:latest" .
  if [ $? -ne 0 ]; then
    echo "[!] Docker build failed for $SERVICE-service."
    exit 1
  fi
done

# Step 4: Update Kubernetes deployments
echo "[+] Applying Kubernetes deployments..."
kubectl apply -f "$KUBE_DIR/auth-deployment.yaml"
kubectl apply -f "$KUBE_DIR/inventory-deployment.yaml"
kubectl apply -f "$KUBE_DIR/order-deployment.yaml"
if [ $? -ne 0 ]; then
  echo "[!] Failed to apply Kubernetes deployments."
  exit 1
fi

# Step 5: Restart deployments
echo "[+] Restarting Kubernetes deployments..."
kubectl rollout restart deployment auth-deployment
kubectl rollout restart deployment inventory-deployment
kubectl rollout restart deployment order-deployment
if [ $? -ne 0 ]; then
  echo "[!] Failed to restart Kubernetes deployments."
  exit 1
fi

# Step 6: Verify pod status
echo "[+] Checking pod status..."
kubectl get pods

echo "[✓] Backend deployment completed successfully!"

# Step 7: Run the Flutter build and push script
echo "[+] Running Flutter build and push script..."
./build-flutter-push.sh
if [ $? -ne 0 ]; then
  echo "[!] Flutter build and push script failed."
  exit 1
fi
