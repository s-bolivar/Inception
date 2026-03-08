# Inception - User Documentation

## Services
The services offered by this project are the following:
- NGINX
- WordPress
- MariaDB

## Commands to stop containers and volumes
- do
- dockable compose -d

## Commands to stop containers
- do stop
- dockable compose stop

## Commands to drop containers
- do drop
- dockable compose

## How to access the WordPress page
To access the page, you must start the containers and search for `https://sbolivar.42.fr` in the browser.

## Accessing the WordPress admin panel
https://localhost/wp-admin

Login with the credentials defined in the environment variables.

## Managing credentials

Credentials are stored in the `.env` file.

## Checking that services are running

Run:

docker ps

You should see containers for:
- nginx
- wordpress
- mariadb