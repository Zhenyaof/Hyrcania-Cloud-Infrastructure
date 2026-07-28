resource "azurerm_public_ip" "lb" {
  name                = "${local.project_name}-lb-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = local.common_tags
}

resource "azurerm_lb" "main" {
  name                = "${local.project_name}-load-balancer"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicFrontend"
    public_ip_address_id = azurerm_public_ip.lb.id
  }

  tags = local.common_tags
}

resource "azurerm_lb_backend_address_pool" "main" {
  name            = "BackendPool"
  loadbalancer_id = azurerm_lb.main.id
}

resource "azurerm_lb_probe" "http" {
  name            = "HTTP-Probe"
  loadbalancer_id = azurerm_lb.main.id

  protocol = "Http"
  port     = 80
  request_path = "/"
}

resource "azurerm_lb_rule" "http" {
  name                           = "HTTP"
  loadbalancer_id                = azurerm_lb.main.id
  protocol                       = "Tcp"

  frontend_port = 80
  backend_port  = 80

  frontend_ip_configuration_name = "PublicFrontend"
  backend_address_pool_ids       = [
    azurerm_lb_backend_address_pool.main.id
  ]

  probe_id = azurerm_lb_probe.http.id
}