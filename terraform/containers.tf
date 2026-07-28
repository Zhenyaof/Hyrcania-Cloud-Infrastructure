resource "azurerm_container_registry" "main" {
  name                = "hyrcaniaacr"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  sku           = "Basic"
  admin_enabled = true

  tags = local.common_tags
}
