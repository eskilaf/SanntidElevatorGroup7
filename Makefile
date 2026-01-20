
TARGET := out

.PHONY: all build run test clean

all: build

build: 
	go build -o $(TARGET) main.go

run: build ## Build and run the Go application
	./$(TARGET)

test: ## Run tests with race detection
	go test -v -race ./...

clean: ## Remove generated files
	go clean
	rm -f $(TARGET)

