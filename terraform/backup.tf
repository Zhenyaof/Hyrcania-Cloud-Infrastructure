resource "azurerm_recovery_services_vault" "main" {
  name                = "${local.project_name}-recovery-vault"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  sku = "Standard"

  soft_delete_enabled = true

  tags = local.common_tags
}

resource "azurerm_backup_policy_vm" "daily" {
  name                = "DailyBackupPolicy"
  resource_group_name = azurerm_resource_group.main.name
  recovery_vault_name = azurerm_recovery_services_vault.main.name

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 30
  }
}

resource "azurerm_backup_protected_vm" "vm" {
  resource_group_name = azurerm_resource_group.main.name
  recovery_vault_name = azurerm_recovery_services_vault.main.name

  source_vm_id     = azurerm_linux_virtual_machine.main.id
  backup_policy_id = azurerm_backup_policy_vm.daily.id
}