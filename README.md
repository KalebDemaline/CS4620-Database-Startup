# CS4620-Database-Startup

This repository contains a Docker setup to start a MySQL container with the database used in CS 4620. It includes a Dockerfile to build the image and a Docker Compose file to help manage the container.

## Prerequisites

Make sure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)

## Getting Started

Follow these steps to build the Docker image and start the MySQL container.

### 1. Clone the Repository

```bash
git clone <repository-url>
cd CS4620-DATABASE-STARTUP
```

### 2. Build and Run the Container
```bash
docker-compose up --build -d
```

### 3. Access Container
#### Command for MySQL CLI
```bash
docker exec -it company_mysql_db mycli -u root AntonsDB
```

#### Command for Container Terminal
```bash
docker exec -it company_mysql_db /bin/bash
```

### 4. Stopping and Removing Container
```bash
docker-compose down
```

> [!WARNING]  
> All changes to the DB will be lost after stopping container!
