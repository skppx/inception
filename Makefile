all:
	docker compose -f ./srcs/docker-compose.yml up -d --build
down:
	docker compose -f ./srcs/docker-compose.yml down -v
log:
	docker compose -f ./srcs/docker-compose.yml logs -f

.PHONY: all down log
