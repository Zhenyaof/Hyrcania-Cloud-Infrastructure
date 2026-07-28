Terraform Infrastructure

This directory contains the Terraform configuration used to provision the Azure infrastructure for the Hyrcania Cloud Infrastructure project.

The infrastructure follows Infrastructure as Code (IaC) principles by separating Azure resources into logical components, making the project easier to understand, maintain, and extend.

Folder Structure
terraform/
├── versions.tf
├── providers.tf
├── variables.tf
├── locals.tf
├── resource-group.tf
├── networking.tf
├── security.tf
├── storage.tf
├── compute.tf
├── monitoring.tf
├── containers.tf
├── load-balancer.tf
├── application-gateway.tf
├── firewall.tf
├── vpn-gateway.tf
├── backup.tf
├── aks.tf
├── outputs.tf
└── terraform.tfvars.example
File Overview
File	Purpose
versions.tf	Defines the required Terraform and AzureRM provider versions.
providers.tf	Configures the Azure provider.
variables.tf	Declares reusable input variables.
locals.tf	Stores shared local values and resource tags.
resource-group.tf	Creates the Azure Resource Group.
networking.tf	Creates the Virtual Network and subnets.
security.tf	Defines Network Security Groups and security rules.
storage.tf	Deploys the Storage Account, Blob Container, and File Share.
compute.tf	Creates the Ubuntu Virtual Machine, NIC, and Public IP.
monitoring.tf	Configures Azure Monitor and Log Analytics Workspace.
containers.tf	Creates the Azure Container Registry (ACR).
load-balancer.tf	Configures an Azure Standard Load Balancer.
application-gateway.tf	Deploys Azure Application Gateway for Layer 7 traffic management.
firewall.tf	Creates Azure Firewall resources.
vpn-gateway.tf	Deploys the Azure VPN Gateway for hybrid connectivity.
backup.tf	Configures Recovery Services Vault and VM backup policy.
aks.tf	Deploys Azure Kubernetes Service (AKS) and integrates it with ACR.
outputs.tf	Exposes useful resource outputs after deployment.
terraform.tfvars.example	Example variable values for deployment.
Azure Resources

This Terraform configuration provisions:

Resource Group
Virtual Network
Multiple Subnets
Network Security Groups
Ubuntu Virtual Machine
Public IP Addresses
Network Interfaces
Storage Account
Blob Storage
Azure File Share
Azure Monitor
Log Analytics Workspace
Azure Container Registry
Azure Load Balancer
Azure Application Gateway
Azure Firewall
Azure VPN Gateway
Recovery Services Vault
Azure Backup
Azure Kubernetes Service (AKS)
Deployment Workflow
terraform init
terraform validate
terraform plan
terraform apply
Project Notes

This Terraform configuration was developed as part of the Hyrcania Cloud Infrastructure portfolio project. It demonstrates Infrastructure as Code practices, Azure resource organization, and modular Terraform design.

Some enterprise services have been included to illustrate production-oriented architecture. The configuration is intended for educational and portfolio purposes and can be extended for real-world deployments.