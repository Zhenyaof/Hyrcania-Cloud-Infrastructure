output "virtual_network_name" {
  value = azurerm_virtual_network.main.name
}

output "virtual_network_id" {
  value = azurerm_virtual_network.main.id
}

output "management_subnet_id" {
  value = azurerm_subnet.management.id
}

output "web_subnet_id" {
  value = azurerm_subnet.web.id
}

output "application_subnet_id" {
  value = azurerm_subnet.application.id
}

output "database_subnet_id" {
  value = azurerm_subnet.database.id
}

output "bastion_subnet_id" {
  value = azurerm_subnet.bastion.id
}
