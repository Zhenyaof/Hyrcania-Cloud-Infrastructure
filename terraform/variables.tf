variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "Sweden Central"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "hyrcania-rg"
}