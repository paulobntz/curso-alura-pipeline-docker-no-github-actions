build-go:
	go build main.go
build-image:
	docker build -t paulobntz/go_ci:latest .
build: build-go build-image
run:
	docker run -d paulobntz/go_ci:latest
all: build run