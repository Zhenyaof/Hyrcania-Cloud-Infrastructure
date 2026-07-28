resource "azurerm_public_ip" "firewall" {
  name                = "${local.project_name}-firewall-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = local.common_tags
}

resource "azurerm_firewall" "main" {
  name                = "${local.project_name}-firewall"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"

  ip_configuration {
    name                 = "firewall-ip-config"
    subnet_id            = subnet_id = azurerm_subnet.firewall.id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }

  tags = local.common_tags
}