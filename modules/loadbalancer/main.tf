
data "azurerm_resource_group" "rgds" {
name                    = var.res_group
}


####Load balancer for web virtual machine

##Public IP for web Load balancer
resource "azurerm_public_ip" "pipweb" {
  name                = var.pipwebname
  resource_group_name = data.azurerm_resource_group.rgds.name
  location            = data.azurerm_resource_group.rgds.location
  allocation_method   = "Static"
}
resource "azurerm_lb" "web_lb" {
  name                =  var.web_lb_name
  resource_group_name = data.azurerm_resource_group.rgds.name
  location            = data.azurerm_resource_group.rgds.location
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.pipweb.id
  }
 
  }
####Load balancer for app virtual machine

##Public IP for app Load balancer
  resource "azurerm_public_ip" "pipapp" {
  name                = var.pipappname
  resource_group_name = data.azurerm_resource_group.rgds.name
  location            = data.azurerm_resource_group.rgds.location
  allocation_method   = "Static"
}
resource "azurerm_lb" "app_lb" {
  name                = var.app_lb_name
  resource_group_name = data.azurerm_resource_group.rgds.name
  location            = data.azurerm_resource_group.rgds.location
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.pipapp.id
  }
 
  }
