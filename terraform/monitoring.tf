resource "azurerm_log_analytics_workspace" "main" {
  name                = "${local.project_name}-log-analytics"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  sku               = "PerGB2018"
  retention_in_days = 30

  tags = local.common_tags
}

resource "azurerm_monitor_diagnostic_setting" "vm" {
  name                       = "${local.project_name}-vm-diagnostics"
  target_resource_id         = azurerm_linux_virtual_machine.main.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  enabled_metric {
    category = "AllMetrics"
  }
}
