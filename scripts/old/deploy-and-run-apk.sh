#!/bin/bash
set -e

echo "[1] Pull latest main branch"
git checkout main
git pull origin main

echo "[2] Build Docker images"
docker build -t ghcr.io/commin4u/auth-service:latest ./auth
docker build -t ghcr.io/commin4u/inventory-service:latest ./inventory
docker build -t ghcr.io/commin4u/order-service:latest ./order

echo "[3] Apply Kubernetes manifests"
kubectl apply -k kubernetes/

echo "[4] Build Android APK"
cd app
./gradlew assembleDebug

APK_PATH=./app/build/outputs/apk/debug/app-debug.apk
if [ -f "$APK_PATH" ]; then
    echo "[5] Installing APK to WSA"
    adb connect 127.0.0.1:58526
    adb install -r "$APK_PATH"
else
    echo "APK not found at $APK_PATH"
    exit 1
fi

echo "Done: Deployed to K8s and launched on WSA"
