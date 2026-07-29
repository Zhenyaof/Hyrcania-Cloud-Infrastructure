# Hyrcania Cloud Infrastructure - Docker

## Overview

This directory contains the Docker implementation of the Hyrcania Cloud Infrastructure project.

The objective of this section is to containerize the application, manage multiple services using Docker Compose, implement basic container security practices, and prepare the application for future cloud deployment using Azure Container Registry (ACR) and Azure Kubernetes Service (AKS).

---

# Docker Architecture

                     Docker Host

                          |

                hyrcania-network

                          |

          +---------------+---------------+

          |                               |

          ▼                               ▼


   Hyrcania Application             PostgreSQL Database

   Flask Container                  PostgreSQL 16 Container


          |                               |

          |                               |

          +---------------+---------------+

                          |

                Persistent Volume

---

# Project Structure


docker/

├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── .gitignore
├── .env.example
├── README.md
├── IMAGE_VERSIONING.md
├── ACR_WORKFLOW.md
│
└── app/
│
├── app.py
└── requirements.txt


---

# Application Stack

## Application Layer

The application is built using:

- Python 3.12
- Flask Framework
- REST API endpoints
- PostgreSQL connectivity


## Database Layer

The database service uses:

- PostgreSQL 16
- Docker managed volume
- Internal container communication


---

# Dockerfile Implementation

The Dockerfile creates a custom application image.

Implemented features:

- Python slim base image
- Dependency installation
- Application packaging
- Non-root execution
- Optimized container environment


Security improvement:

Instead of running the application as root:


root user
|
|
application


The container runs with:


hyrcania user
|
|
application


Reducing potential security impact.

---

# Docker Compose Implementation

Docker Compose manages the complete application stack.

Implemented services:

## hyrcania-app

Responsibilities:

- Runs Flask application
- Exposes application API
- Connects to PostgreSQL database
- Provides health monitoring


## hyrcania-db

Responsibilities:

- Runs PostgreSQL database
- Stores application data
- Provides persistent storage


---

# Networking

Docker Compose creates a dedicated bridge network:


hyrcania-network


Communication flow:


hyrcania-app

  |

  |

hyrcania-db:5432


The database is not exposed externally.

Only the application is accessible:


localhost:8080


---

# Persistent Storage

PostgreSQL uses a Docker volume:


postgres-data


Purpose:

- Preserve database data
- Prevent data loss after container restart
- Separate storage from container lifecycle


Example:


Container Removed

    |

    |

Volume Remains

    |

    |

Database Data Preserved


---

# Environment Configuration

Application configuration is separated from source code.

Example:


.env.example


Contains:

- Application name
- Runtime environment
- Database host
- Database port
- Database name
- Database username
- Database password


Actual environment files:


.env


are excluded from GitHub.

Production environments should use:

- Azure Key Vault
- Kubernetes Secrets
- Managed Identity

---

# Container Health Monitoring

Health checks are implemented for both services.


## Application Health Check

Endpoint:


GET /health


Checks:

- Flask availability
- Database connection


Example response:

```json
{
    "application": "hyrcania-app",
    "database": "connected",
    "status": "healthy"
}
Database Health Check

PostgreSQL uses:

pg_isready

to verify database availability.

Docker Security Practices

Implemented:

Non-root container execution

Containers do not run with root privileges.

Secret separation

Sensitive configuration is not stored inside:

docker-compose.yml

Instead:

.env

is used locally.

.dockerignore

Prevents unnecessary files from being included in Docker images.

Minimal base image

Using:

python:3.12-slim

reduces image size and attack surface.

Running The Application
Build Containers
docker compose build
Start Services
docker compose up -d
Check Containers
docker ps

Expected:

hyrcania-app     healthy

hyrcania-db      healthy
View Logs
docker logs hyrcania-app
Stop Services
docker compose down
Testing

Application:

http://localhost:8080

Health endpoint:

http://localhost:8080/health

Expected:

Application: Running

Database: Connected

Status: Healthy
Docker Image Versioning

Images use version tags instead of relying only on:

latest

Example:

hyrcania-app:v1.0.0

Version format:

MAJOR.MINOR.PATCH

Example:

v1.0.0

Initial release

v1.1.0

New features

v1.0.1

Bug fixes

Azure Container Registry (ACR) Workflow

Future cloud workflow:

Developer

    |

    |

Docker Build

    |

    |

Docker Image

    |

    |

Azure Container Registry

    |

    |

Azure Kubernetes Service

    |

    |

Application Gateway

    |

    |

Users

Example commands:

Build:

docker build -t hyrcania-app .

Tag:

docker tag hyrcania-app \
hyrcaniaregistry.azurecr.io/hyrcania-app:v1.0.0

Push:

docker push \
hyrcaniaregistry.azurecr.io/hyrcania-app:v1.0.0
Current Docker Achievements

Completed:

✅ Flask application container
✅ PostgreSQL database container
✅ Docker Compose orchestration
✅ Custom Docker network
✅ Persistent storage
✅ Environment configuration
✅ Health checks
✅ Non-root security model
✅ Image versioning strategy
✅ ACR deployment workflow preparation

Future Integration

Docker will later integrate with:

Terraform
    |
    |
Azure Infrastructure

+

Docker
    |
    |
Application Containers

+

AKS
    |
    |
Production Kubernetes Deployment

Hyrcania Cloud Infrastructure Cloud Engineering Portfolio Project
