# Inception - Developer Documentation

## Prerequisites

Before running the project you need:

- Docker
- Docker Compose
- Make

Check installation:

docker --version
docker compose version
make --version

## Environment setup

Create the `.env` file and define the required variables.

## Building the project

Build and start containers:

make or docker compose up --build

## Managing containers

List running containers:

docker ps

Stop containers:

- docker compose down or make down

Rebuild containers:

- docker compose build or make build

## Volumes and data persistence

The project uses Docker volumes to persist data.

- WordPress files -> `/home/user/data/wordpress`
- MariaDB data -> `/home/user/data/mariadb`

These volumes ensure that data remains even if containers are removed.

## Logs

To see container logs:

- docker compose logs nginx
- docker compose logs wordpress
- docker compose logs mariadb