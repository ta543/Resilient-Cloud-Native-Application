#!/bin/bash

echo "Setting up Istio on Kubernetes..."

# Define the Istio version to use
ISTIO_VERSION="1.11.4"

echo "Downloading Istio ${ISTIO_VERSION}..."
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} sh -

echo "Istio downloaded successfully."

# Move to the Istio package directory
cd istio-${ISTIO_VERSION}

echo "Installing Istio with demo profile..."
# Install Istio with the demo profile
./bin/istioctl install --set profile=demo -y

echo "Istio installed successfully."

# Enable automatic sidecar injection for the default namespace
kubectl label namespace default istio-injection=enabled --overwrite

echo "Automatic sidecar injection enabled for the default namespace."

echo "Istio setup completed."
