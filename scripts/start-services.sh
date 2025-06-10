#!/bin/bash
kubectl port-forward svc/auth-service 30081:9000 &
kubectl port-forward svc/inventory-service 30082:8085 &
kubectl port-forward svc/order-service 30083:8089 &