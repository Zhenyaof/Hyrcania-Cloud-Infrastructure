variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "hyrcania-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)

  default = [
    "10.0.0.0/16"
  ]
}

variable "ssh_public_key" {
  description = "SSH public key"

  type = string

  default = "ssh-rsa YOUR_PUBLIC_KEY"
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true
}
variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
  default     = "hyrcania-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "West Europe"
}