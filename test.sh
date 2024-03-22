#!/bin/bash

# Define the services directory path
SERVICES_DIR="$(pwd)/Istio-Portfolio-Project/src/services"

# Ensure the services directory exists
mkdir -p "$SERVICES_DIR"
echo "Services directory ensured at $SERVICES_DIR"

# Create service1 directory
mkdir -p "$SERVICES_DIR/service1"
echo "Created directory: $SERVICES_DIR/service1"

# Create service1 Dockerfile
cat > "$SERVICES_DIR/service1/Dockerfile" <<EOF
# Use an official Golang runtime as the base image
FROM golang:1.17-alpine

# Set the Current Working Directory inside the container
WORKDIR /go/src/app

# Copy everything from the current directory to the PWD (Present Working Directory) inside the container
COPY . .

# Download dependencies using go mod
RUN go mod download

# Build the Go app
RUN go build -o main .

# Run the executable
CMD ["./main"]
EOF
echo "Dockerfile created for service1"

# Create sample Go file for service1
cat > "$SERVICES_DIR/service1/main.go" <<EOF
package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello from Service 1!")
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":80", nil)
}
EOF
echo "main.go created for service1"

# Create service2 directory
mkdir -p "$SERVICES_DIR/service2"
echo "Created directory: $SERVICES_DIR/service2"

# Create service2 Dockerfile
cat > "$SERVICES_DIR/service2/Dockerfile" <<EOF
# Use an official Golang runtime as the base image
FROM golang:1.17-alpine

# Set the Current Working Directory inside the container
WORKDIR /go/src/app

# Copy everything from the current directory to the PWD (Present Working Directory) inside the container
COPY . .

# Download dependencies using go mod
RUN go mod download

# Build the Go app
RUN go build -o main .

# Run the executable
CMD ["./main"]
EOF
echo "Dockerfile created for service2"

# Create sample Go file for service2
cat > "$SERVICES_DIR/service2/main.go" <<EOF
package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello from Service 2!")
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":80", nil)
}
EOF
echo "main.go created for service2"

echo "Service files created successfully in $SERVICES_DIR"
