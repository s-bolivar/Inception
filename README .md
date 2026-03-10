*This project has been created as part of the 42 curriculum by [sbolivar].*

# Inception

## Description

Inception is a system administration project from the 42 curriculum. The goal is to set up a small multi-service infrastructure using **Docker** and **Docker Compose**, running inside a virtual machine. Each service runs in its own dedicated container, built from custom Dockerfiles based on Alpine or Debian — no pre-built images from Docker Hub are allowed.

The infrastructure includes:
- **NGINX** — the sole entry point, reverse proxy over port 443 with TLSv1.2/TLSv1.3
- **WordPress** — with php-fpm, served behind NGINX
- **MariaDB** — database backend for WordPress

### Docker in this project

All services are orchestrated via a single `docker-compose.yml`. Each container is isolated, communicates over a custom Docker bridge network, and persists data through Docker volumes. Configuration is managed through environment variables and Docker secrets stored outside the repository.

### Design choices

**Virtual Machines vs Docker**
VMs emulate an entire operating system, including the kernel, which makes them heavier and slower to start. Docker containers share the host kernel and isolate only the processes and filesystem, making them much more lightweight and faster to spin up. For this project, Docker is ideal since we want to run multiple isolated services without the overhead of full VMs.

**Docker Network vs Host Network**
With host networking, the container shares the host's network stack directly, which removes isolation and can cause port conflicts. A custom Docker bridge network (`inception`) is used here so containers can communicate with each other by name, while remaining isolated from the host and from each other unless explicitly connected.

**Docker Volumes vs Bind Mounts**
Bind mounts link a specific host directory to a container path, making them dependent on the host's folder structure. Docker volumes are managed by Docker itself, are more portable, and persist independently of the container lifecycle. Volumes are used in this project for the MariaDB data and WordPress files to ensure persistence across container restarts.

---

## Instructions

### Requirements

- Docker and Docker Compose installed
- A virtual machine (project requirement)
- `make`

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-login>/inception.git
   cd inception
   ```

2. Configure your environment:
   ```bash
   cp srcs/.env
   # Fill in your values
   ```

3. Add your domain to `/etc/hosts`:
   ```bash
   echo "127.0.0.1 <your-login>.42.fr" | sudo tee -a /etc/hosts
   ```

4. Build and start:
   ```bash
   make
   ```

5. Visit `https://<your-login>.42.fr` in your browser.

### Makefile commands

```bash
make        # Build and start all containers
make down   # Stop all containers
make fclean # Stop and remove all containers, volumes, and images
make re     # Full rebuild from scratch
```

---

## Resources

### Docker & infrastructure
- [Docker official documentation](https://docs.docker.com/)
- [Docker Compose reference](https://docs.docker.com/compose/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Networking in Docker](https://docs.docker.com/network/)
- [Docker volumes](https://docs.docker.com/storage/volumes/)
- [Docker secrets](https://docs.docker.com/engine/swarm/secrets/)

### Services
- [NGINX documentation](https://nginx.org/en/docs/)
- [WordPress CLI (WP-CLI)](https://wp-cli.org/)
- [MariaDB documentation](https://mariadb.com/kb/en/documentation/)
- [php-fpm configuration](https://www.php.net/manual/en/install.fpm.configuration.php)

### TLS
- [Mozilla SSL Configuration Generator](https://ssl-config.mozilla.org/)
- [OpenSSL documentation](https://www.openssl.org/docs/)

### AI usage
AI (ChatGPT / Claude) was used in this project for the following tasks:
- Debugging NGINX and php-fpm configuration issues
- Understanding Docker networking and volume behaviour
- Clarifying differences between Docker secrets and environment variables
- Generating boilerplate Dockerfile structures to iterate on
- Reviewing `docker-compose.yml` syntax and logic
