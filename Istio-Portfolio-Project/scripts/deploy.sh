#!/bin/bash

# Deploy.sh
# This script deploys the application to a Kubernetes cluster with Istio.

# Set the namespace where you want to deploy your application
NAMESPACE="default"

# Path to the directory containing your Kubernetes and Istio configuration files
CONFIG_DIR="./k8s"

echo "Starting deployment process..."

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null
then
    echo "kubectl could not be found, please install it to continue."
    exit 1
fi

# Apply the Kubernetes configurations
echo "Applying Kubernetes configurations..."
kubectl apply -f $CONFIG_DIR/kubernetes/ -n $NAMESPACE

# Apply the Istio configurations
echo "Applying Istio configurations..."
kubectl apply -f $CONFIG_DIR/istio/ -n $NAMESPACE

# Verify deployment
echo "Verifying deployment..."
kubectl get services -n $NAMESPACE
kubectl get pods -n $NAMESPACE

echo "Application deployed successfully."
