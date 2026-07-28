resource "azurerm_public_ip" "vm" {
  name                = "${local.project_name}-vm-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = local.common_tags
}

resource "azurerm_network_interface" "vm" {
  name                = "${local.project_name}-vm-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.management.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm.id
  }

  tags = local.common_tags
}

resource "azurerm_linux_virtual_machine" "main" {
  name                = "${local.project_name}-vm"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  size = "Standard_B2s"

  admin_username = "azureadmin"

  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.vm.id
  ]

  admin_ssh_key {
    username   = "azureadmin"
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  tags = local.common_tags
}
