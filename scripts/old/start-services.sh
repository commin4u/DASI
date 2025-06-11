#!/bin/bash
kubectl port-forward svc/auth-service 30081:9000 &
kubectl port-forward svc/inventory-service 30082:8085 &
kubectl port-forward svc/order-service 30083:8089 &


cd /c/Users/f2p/AppData/Local/Android/Sdk/platform-tools/

./adb connect 127.0.0.1:58526

./adb reverse tcp:9000 tcp:30081
./adb reverse tcp:8085 tcp:30082
./adb reverse tcp:8089 tcp:30083