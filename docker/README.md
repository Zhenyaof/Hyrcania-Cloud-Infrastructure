# Hyrcania Cloud Infrastructure - Docker Implementation

## Overview

This directory contains the Docker configuration used to containerize and run application workloads for the Hyrcania Cloud Infrastructure project.

The Docker implementation demonstrates application containerization using:

- Docker images
- Docker containers
- Docker Compose
- Container networking
- Persistent storage
- Environment configuration
- Health monitoring


Docker provides a consistent runtime environment and allows applications to be packaged and deployed independently from the underlying infrastructure.

---

# Container Architecture

The Docker architecture consists of an application container and a database container.

```
                    User

                     |

                     |

              Application Container

                     |

                     |

              Docker Network

                     |

                     |

              PostgreSQL Database

                     |

                     |

              Persistent Volume
```

The architecture separates:

- Application layer
- Database layer
- Storage layer


This improves:

- Maintainability
- Scalability
- Portability
- Deployment consistency

---

# Docker Project Structure

```
docker/

├── app/
│   ├── app.py
│   └── requirements.txt
│
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── .env.example
└── README.md
```

---

# File Overview

| File | Purpose |
|---|---|
| Dockerfile | Defines the application container image |
| docker-compose.yml | Defines multi-container deployment |
| app/app.py | Application source code |
| app/requirements.txt | Python dependencies |
| .dockerignore | Excludes unnecessary files from image builds |
| .env.example | Example environment configuration |
| README.md | Docker documentation |

---

# Application Container

The application is packaged into a Docker image.

Dockerfile responsibilities:

- Select base image
- Install dependencies
- Copy application code
- Configure runtime environment
- Start application service


Application workflow:

```
Application Code

        |

        |

Dockerfile

        |

        |

Docker Image

        |

        |

Docker Container
```

---

# Docker Image Creation

The application image is built using:

```bash
docker build -t hyrcania-app .
```

This command:

- Reads the Dockerfile
- Installs dependencies
- Creates a reusable image
- Tags the image as `hyrcania-app`

---

# Running the Application Container

The container can be started using:

```bash
docker run -d -p 8080:5000 --name hyrcania-app hyrcania-app
```

Explanation:

| Option | Purpose |
|---|---|
| -d | Runs container in background |
| -p | Maps host port to container port |
| --name | Assigns container name |

Example:

```
Host

8080

 |

 |

Container

5000
```

---

# Docker Compose Architecture

Docker Compose manages multiple containers as one application stack.

The Hyrcania Docker environment includes:

```
docker-compose.yml

        |

        |

+----------------+

| Application    |

| Container      |

+----------------+

        |

        |

+----------------+

| PostgreSQL     |

| Database       |

+----------------+
```

---

# PostgreSQL Database Container

The database container provides persistent data storage.

Implemented:

- PostgreSQL 16
- Database environment variables
- Persistent volume
- Health check


Database workflow:

```
Application

     |

     |

PostgreSQL Container

     |

     |

Persistent Storage Volume
```

---

# Docker Networking

Docker Compose automatically creates a private network.

Communication:

```
Application Container

          |

          |

Docker Network

          |

          |

Database Container
```

Containers communicate using service names instead of public IP addresses.

Example:

```
DATABASE_HOST=db
```

---

# Persistent Storage

Database data is stored using Docker volumes.

Purpose:

- Preserve database data
- Prevent data loss after container restart
- Separate storage from container lifecycle


Storage flow:

```
PostgreSQL Container

          |

          |

Docker Volume

          |

          |

Persistent Data
```

---

# Environment Configuration

Sensitive configuration is managed through environment variables.

Example:

```
.env.example
```

Contains:

- Database name
- Database username
- Application configuration


Example:

```env
POSTGRES_DB=hyrcania
POSTGRES_USER=admin
POSTGRES_PASSWORD=example_password
```

Sensitive values should not be committed to GitHub.

---

# Container Health Checks

Health checks verify that services are running correctly.

Example:

```
Application Container

        Status:

        Healthy


Database Container

        Status:

        Healthy
```

Health checks improve:

- Reliability
- Troubleshooting
- Service availability

---

# Docker Compose Commands

## Start Services

```bash
docker compose up -d
```

Starts all containers in detached mode.

---

## Stop Services

```bash
docker compose down
```

Stops and removes containers.

---

## View Running Containers

```bash
docker ps
```

Shows active containers.

---

## View All Containers

```bash
docker ps -a
```

Shows running and stopped containers.

---

## View Container Logs

```bash
docker logs CONTAINER_NAME
```

Example:

```bash
docker logs hyrcania-app
```

---

## Rebuild Containers

```bash
docker compose up -d --build
```

Rebuilds images and starts services.

---

## View Images

```bash
docker images
```

Displays available Docker images.

---

## Remove Images

```bash
docker rmi IMAGE_NAME
```

Removes unused images.

---

# Docker Workflow

The complete Docker lifecycle:

```
Application Code

        |

        |

Create Dockerfile

        |

        |

Build Image

        |

        |

Run Container

        |

        |

Compose Multiple Services

        |

        |

Deploy Application
```

---

# Security Practices Applied

The Docker implementation follows security practices:

Implemented:

✅ Environment variables instead of hardcoded secrets  
✅ .dockerignore configuration  
✅ Separate database container  
✅ Private container networking  
✅ Health monitoring  
✅ Minimal base image usage  


---

# Integration With Azure Infrastructure

The Docker application is designed to integrate with the Azure infrastructure.

Deployment flow:

```
Docker Application

        |

        |

Container Registry

        |

        |

Azure Infrastructure

        |

        |

Cloud Deployment
```

The Docker layer provides the application runtime, while Terraform manages the cloud infrastructure.

---

# Project Status

Completed:

✅ Application Containerization  
✅ Docker Image Creation  
✅ Docker Compose Deployment  
✅ PostgreSQL Integration  
✅ Container Networking  
✅ Persistent Storage  
✅ Environment Configuration  
✅ Health Checks  


---

# Future Improvements

Possible improvements:

- Azure Container Registry automation
- CI/CD pipeline integration
- Container security scanning
- Kubernetes deployment
- Production image optimization


---

# Hyrcania Cloud Infrastructure

Cloud Engineering Portfolio Project