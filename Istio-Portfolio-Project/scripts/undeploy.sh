#!/bin/bash

echo "Starting the undeployment process..."

# Delete Kubernetes deployments and services
kubectl delete deployment myapp-deployment
kubectl delete service myapp-service

# Delete Istio resources
kubectl delete gateway myapp-gateway
kubectl delete virtualservice myapp-virtualservice
kubectl delete destinationrule myapp-destinationrule

echo "Undeployment process completed."
