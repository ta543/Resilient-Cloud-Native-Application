# Use an official Golang runtime as the base image
FROM golang:1.17-alpine

# Set the Current Working Directory inside the container
WORKDIR /go/src/app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download dependencies using go mod
RUN go mod download

# Copy the entire project directory into the container
COPY . .

# Build the Go app
RUN go build -o main .

# Expose port 80 to the outside world
EXPOSE 80

# Command to run the executable
CMD ["./main"]
