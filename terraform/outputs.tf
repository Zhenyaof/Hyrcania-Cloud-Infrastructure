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

output "storage_account_name" {
  value = azurerm_storage_account.main.name
}

output "storage_account_id" {
  value = azurerm_storage_account.main.id
}

output "blob_container_name" {
  value = azurerm_storage_container.blob.name
}

output "file_share_name" {
  value = azurerm_storage_share.files.name
}
output "vm_name" {
  value = azurerm_linux_virtual_machine.main.name
}

output "vm_public_ip" {
  value = azurerm_public_ip.vm.ip_address
}

output "vm_private_ip" {
  value = azurerm_network_interface.vm.private_ip_address
}
output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.main.name
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.main.id
}
output "container_registry_name" {
  value = azurerm_container_registry.main.name
}

output "container_registry_login_server" {
  value = azurerm_container_registry.main.login_server
}

output "container_registry_admin_username" {
  value = azurerm_container_registry.main.admin_username
}
