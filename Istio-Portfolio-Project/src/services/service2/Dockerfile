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
