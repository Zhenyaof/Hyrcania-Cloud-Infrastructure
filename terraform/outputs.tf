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
output "load_balancer_name" {
  value = azurerm_lb.main.name
}

output "load_balancer_public_ip" {
  value = azurerm_public_ip.lb.ip_address
}
output "application_gateway_name" {
  value = azurerm_application_gateway.main.name
}

output "application_gateway_public_ip" {
  value = azurerm_public_ip.appgw.ip_address
}
output "firewall_name" {
  value = azurerm_firewall.main.name
}

output "firewall_public_ip" {
  value = azurerm_public_ip.firewall.ip_address
}
output "vpn_gateway_name" {
  value = azurerm_virtual_network_gateway.main.name
}

output "vpn_gateway_public_ip" {
  value = azurerm_public_ip.vpn.ip_address
}
output "recovery_services_vault_name" {
  value = azurerm_recovery_services_vault.main.name
}

output "backup_policy_name" {
  value = azurerm_backup_policy_vm.daily.name
}