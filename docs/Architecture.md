# Hyrcania Cloud Infrastructure Architecture

## Overview

This document describes the overall architecture of the Hyrcania Cloud Infrastructure project.

The architecture combines:

- Azure Cloud Infrastructure
- Terraform Infrastructure as Code
- Docker Containerization
- Application and Database Services
- Security and Monitoring Components

The goal is to provide a scalable, secure, and maintainable cloud environment.

---

# High-Level Architecture

```mermaid
flowchart TD

    User((Internet Users))

    AGW[Azure Application Gateway]
    LB[Azure Load Balancer]

    subgraph Azure["Microsoft Azure"]

        subgraph VNET["Azure Virtual Network"]

            subgraph Security["Security Layer"]
                FW[Azure Firewall]
                NSG[Network Security Groups]
                Bastion[Azure Bastion]
            end

            subgraph Compute["Compute Layer"]

                VM[Ubuntu Virtual Machine]

                subgraph Docker["Docker Environment"]

                    APP[Application Container<br/>Python Flask]

                    DB[(PostgreSQL Database Container)]

                end

            end

            subgraph Network["Network Segmentation"]

                WebSubnet[Web Subnet]

                AppSubnet[Application Subnet]

                DBSubnet[Database Subnet]

                MgmtSubnet[Management Subnet]

            end

        end


        Storage[(Azure Storage Account)]

        Monitor[Azure Monitor<br/>Log Analytics]

        Backup[Recovery Services Vault]

        ACR[Azure Container Registry]

    end


    User --> AGW

    AGW --> LB

    LB --> VNET

    VNET --> FW

    FW --> VM

    VM --> Docker

    Docker --> APP

    Docker --> DB

    APP --> DB

    APP --> Storage

    ACR --> Docker

    Monitor --> VM

    Backup --> VM

    NSG --> WebSubnet

    NSG --> AppSubnet

    NSG --> DBSubnet

    Bastion --> MgmtSubnet
