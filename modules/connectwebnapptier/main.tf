
resource "azurerm_lb_backend_address_pool" "web_backend_pool" {
  name                = var.webbackendpool
  loadbalancer_id     = data.azurerm_lb.web_lb.id
  resource_group_name = var.res_group

  backend_addresses {
    ip_address = data.azurerm_linux_virtual_machine.webvm.private_ip_address
  }
}

resource "azurerm_lb_backend_address_pool" "web_backend_pool" {
  name                = var.appbackendpool
  loadbalancer_id     = data.azurerm_lb.app_lb.id
  resource_group_name = var.res_group

  backend_addresses {
    ip_address = data.azurerm_linux_virtual_machine.appvm.private_ip_address
  }
}
