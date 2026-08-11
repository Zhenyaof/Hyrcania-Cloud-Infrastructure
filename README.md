# Hyrcania Cloud Infrastructure

## Project Overview

**Hyrcania Cloud Infrastructure** is an end-to-end cloud engineering and DevOps project designed to demonstrate how a modern application infrastructure can be designed, automated, secured, validated, and operated using industry-standard technologies.

The project combines:

- Microsoft Azure
- Terraform Infrastructure as Code
- GitHub Actions CI/CD
- Microsoft Entra ID and Azure OIDC
- Docker and Docker Compose
- Python
- PostgreSQL
- Ubuntu Linux
- Cloud networking and security
- Monitoring and backup

The project follows a production-inspired approach where infrastructure is defined as code, changes are validated automatically, Terraform plans are reviewed before deployment, and cloud authentication is handled through federated identity.

The current development configuration is intentionally **cost-controlled**: the CI/CD pipeline validates and plans infrastructure without automatically maintaining billable Azure resources.

---

# Project Goals

The primary goals of the project are to demonstrate practical knowledge of:

- Cloud infrastructure design
- Infrastructure as Code
- Terraform automation
- CI/CD engineering
- Azure networking
- Cloud security
- OIDC authentication
- Containerized applications
- Linux administration
- Monitoring and reliability
- Infrastructure change management
- Cost-aware cloud engineering

The project is designed to simulate how an engineering team could manage application infrastructure through a controlled and repeatable workflow.

---

# Unified Architecture

The project is organized as a single cloud engineering system rather than separate infrastructure and application components.

The complete flow is:

**Developer → GitHub → CI/CD → Terraform → Azure → Networking → Application Platform → Database → Monitoring**

```mermaid
flowchart TD

    Developer[Developer]

    GitHub[GitHub Repository]

    CI[GitHub Actions CI/CD]

    Terraform[Terraform Infrastructure as Code]

    OIDC[Azure OIDC Authentication]

    Azure[Microsoft Azure]

    VNet[Azure Virtual Network]

    AppGW[Azure Application Gateway]
    Firewall[Azure Firewall]
    LB[Azure Load Balancer]

    AppSubnet[Application Subnet]
    DBSubnet[Database Subnet]
    MgmtSubnet[Management Subnet]
    GatewaySubnet[Gateway Subnet]

    VM[Ubuntu Linux VM]

    Docker[Docker Platform]
    App[Python Application]
    PostgreSQL[(PostgreSQL Database)]

    Monitor[Azure Monitor]
    Logs[Log Analytics Workspace]
    Backup[Recovery Services Vault]

    Developer --> GitHub

    GitHub --> CI

    CI --> Terraform
    CI --> OIDC

    OIDC --> Azure
    Terraform --> Azure

    Azure --> VNet

    VNet --> AppGW
    VNet --> Firewall
    VNet --> LB

    VNet --> AppSubnet
    VNet --> DBSubnet
    VNet --> MgmtSubnet
    VNet --> GatewaySubnet

    AppSubnet --> VM
    VM --> Docker

    Docker --> App
    Docker --> PostgreSQL

    DBSubnet --> PostgreSQL

    VNet --> Monitor
    Monitor --> Logs

    VNet --> Backup
