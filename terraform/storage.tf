resource "azurerm_storage_account" "main" {
  name                     = "hyrcaniastorage01"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = var.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public = false

  tags = local.common_tags
}

resource "azurerm_storage_container" "blob" {
  name                  = "blob-container"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}

resource "azurerm_storage_share" "files" {
  name               = "fileshare"
  storage_account_id = azurerm_storage_account.main.id
  quota              = 100
}
