NAME = Inception

COMPOSE = docker compose -f src/docker-compose.yml

all: build up

build:
	$(COMPOSE) build
	
up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

start:
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs

clean:
	$(COMPOSE) down

fclean:
	$(COMPOSE) down -v --rmi all

re: fclean all

.PHONY: all build up down start stop restart logs clean fclean re