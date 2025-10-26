build-go:
	go build main.go
build-image:
	docker build -t paulobntz/go_ci:latest .
build: build-go build-image
run-db:
	docker-compose up -d
run-app:
	docker run -d --network local-network --name go_ci --env HOST=postgres paulobntz/go_ci:latest
run: run-db run-app
stop-db:
	docker-compose down
stop-app:
	docker rm go_ci --force
stop: stop-app stop-db
