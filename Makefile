NAME = Inception

COMPOSE = docker compose -f docker-compose.yml
ENV = --env -file .env

all: up

build:
	$(COMPOSE) $(ENV) build
	
up:
	$(COMPOSE) $(ENV) up -d

down:
	$(COMPOSE) $(ENV) down

start:
	$(COMPOSE) $(ENV) start

stop:
	$(COMPOSE) $(ENV) stop

restart:
	$(COMPOSE) $(ENV) restart

logs:
	$(COMPOSE) $(ENV) logs

clean:
	$(COMPOSE) $(ENV) down

fclean:
	$(COMPOSE) $(ENV) down -v --rmi all

re: fclean all

.PHONY: all build up down start stop restart logs clean fclean re