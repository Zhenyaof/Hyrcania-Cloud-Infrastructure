resource "azurerm_public_ip" "vpn" {
  name                = "${local.project_name}-vpn-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = local.common_tags
}

resource "azurerm_virtual_network_gateway" "main" {
  name                = "${local.project_name}-vpn-gateway"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  sku = "VpnGw1"

  active_active = false
  enable_bgp    = false

  ip_configuration {
    name                          = "gateway-config"
    public_ip_address_id          = azurerm_public_ip.vpn.id
    subnet_id                     = subnet_id = azurerm_subnet.gateway.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = local.common_tags
}