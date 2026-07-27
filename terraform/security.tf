resource "azurerm_network_security_group" "nsg" {
  for_each = local.nsgs

  name                = "${local.project_name}-${each.value.name}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  tags = local.common_tags
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "22"

  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.nsg["management"].name
}

resource "azurerm_network_security_rule" "http" {
  name                        = "Allow-HTTP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "80"

  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.nsg["web"].name
}

resource "azurerm_network_security_rule" "https" {
  name                        = "Allow-HTTPS"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "443"

  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.nsg["web"].name
}
