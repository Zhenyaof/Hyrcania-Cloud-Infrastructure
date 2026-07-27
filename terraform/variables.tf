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
