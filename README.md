# Inception

42 Madrid project — set up a small infrastructure using Docker Compose inside a virtual machine.

## Services

- **NGINX** — reverse proxy, only entry point via port 443 (TLSv1.2/1.3)
- **WordPress** — with php-fpm
- **MariaDB** — database for WordPress

Each service runs in its own container, built from a custom Dockerfile based on Alpine or Debian.

## Usage

```bash
make        # build and start
make down   # stop
make fclean # remove everything
```

## Structure

```
srcs/
├── docker-compose.yml
├── .env
└── requirements/
    ├── nginx/
    ├── wordpress/
    └── mariadb/
```

## Author

`sbolivar` — 42 Madrid
