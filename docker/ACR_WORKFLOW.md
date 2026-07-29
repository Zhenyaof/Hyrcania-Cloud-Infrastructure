# Azure Container Registry Workflow

## Overview

Azure Container Registry (ACR) is used to store and manage Docker container images.

Hyrcania workflow:

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


## Build Image

Create Docker image:

```bash
docker build -t hyrcania-app .