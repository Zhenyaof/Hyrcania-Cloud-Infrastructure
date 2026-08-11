# Hyrcania Cloud Infrastructure

## Project Overview

Hyrcania Cloud Infrastructure is an end-to-end cloud engineering project that demonstrates the design, automation, security, and documentation of a production-inspired cloud environment.

The project focuses on building a secure, scalable, and maintainable infrastructure using:

- Microsoft Azure
- Terraform Infrastructure as Code
- GitHub Actions CI/CD
- Microsoft Entra ID and Azure OIDC
- Docker containerization
- Linux administration
- Cloud networking and security principles

The main objective is to simulate how a real-world organization could design and manage cloud infrastructure using automated, repeatable, and version-controlled processes.

---

# Project Motivation

Modern applications require infrastructure that is secure, scalable, and easy to maintain.

Manually creating cloud resources can lead to configuration inconsistencies and makes environments difficult to reproduce.

This project demonstrates how a cloud environment can be designed and managed using modern engineering practices:

- Infrastructure as Code
- Cloud networking principles
- Containerized application deployment
- Security-focused architecture
- CI/CD automation
- Version-controlled infrastructure
- Controlled deployment workflows

The goal is to simulate a real-world cloud infrastructure environment where infrastructure changes can be validated, reviewed, and deployed through an automated workflow.

---

# Architecture Overview

The infrastructure is designed around several major layers.

## Cloud Infrastructure Layer

Microsoft Azure provides the foundation of the environment.

The Azure infrastructure includes:

- Azure Virtual Network
- Subnet segmentation
- Network Security Groups
- Azure Firewall
- Application Gateway
- Load Balancer
- Ubuntu Virtual Machine
- Storage services
- Monitoring and backup solutions

The infrastructure is defined using Terraform and can be provisioned when a deployment environment is intentionally enabled.

---

## Infrastructure as Code Layer

Terraform is used to define and automate Azure infrastructure.

Instead of manually creating resources through the Azure Portal, infrastructure is defined as code and stored in Git.

Benefits:

- Version-controlled infrastructure
- Repeatable deployments
- Reduced configuration errors
- Easier maintenance
- Automated infrastructure validation
- Infrastructure change tracking

Terraform documentation:

➡️ [Terraform Documentation](https://github.com/Zhenyaof/Hyrcania-Cloud-Infrastructure/blob/main/terraform/README.md)

---

## CI/CD Layer

GitHub Actions is used to automate Terraform validation and infrastructure change review.

The CI/CD workflow includes:

- Terraform formatting checks
- Terraform validation
- Terraform plan
- Terraform plan artifacts
- Azure OIDC authentication
- GitHub Environment protection
- Manual approval
- Terraform plan review

The current pipeline is intentionally configured as a plan-only workflow to prevent accidental Azure infrastructure deployment and unnecessary cloud costs during development.

---

## Application Platform Layer

The application environment is deployed using Docker.

The containerized architecture includes:

- Python application container
- PostgreSQL database container
- Docker Compose orchestration
- Container networking
- Health monitoring

Docker documentation:

➡️ [Docker Documentation](https://github.com/Zhenyaof/Hyrcania-Cloud-Infrastructure/blob/main/docker/README.md)

---

# High-Level Architecture

The infrastructure follows a layered cloud architecture:

```text
Internet
   |
   v
Azure Application Gateway
   |
   v
Azure Firewall
   |
   v
Azure Virtual Network
   |
   +----------------------+----------------------+
   |                      |                      |
   v                      v                      v
Application Subnet    Database Subnet     Management Subnet
   |                      |                      |
   v                      v                      v
Ubuntu VM              Database            Management
   |
   v
Load Balancer
   |
   v
Monitoring / Logging
