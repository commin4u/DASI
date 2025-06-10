#!/bin/bash

# Start Kubernetes port-forwarding for all services

echo "[+] Starting Kubernetes port-forwarding..."
kubectl port-forward svc/auth-service 30081:80 >/dev/null 2>&1 &
kubectl port-forward svc/inventory-service 30082:80 >/dev/null 2>&1 &
kubectl port-forward svc/order-service 30083:80 >/dev/null 2>&1 &

echo "[+] Waiting for port-forwards to stabilize..."
sleep 5

# Connect to WSA via adb
ADB_PATH="$HOME/AppData/Local/Android/Sdk/platform-tools/adb"
if [ ! -f "$ADB_PATH" ]; then
  echo "[!] ADB not found. Please check path."
  exit 1
fi

echo "[+] Connecting to WSA (attempting localhost:58526)..."
$ADB_PATH connect 127.0.0.1:58526

# Optional: Confirm connection
echo "[+] Connected devices:"
$ADB_PATH devices



echo "[✓] Environment ready. Use these URLs in your app:"
echo "    http://10.0.2.2:30081   → auth"
echo "    http://10.0.2.2:30082   → inventory"
echo "    http://10.0.2.2:30083   → order"
