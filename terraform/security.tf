resource "azurerm_network_security_group" "nsg" {
  for_each = local.nsgs

  name                = "${local.project_name}-${each.value.name}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  tags = local.common_tags
}
