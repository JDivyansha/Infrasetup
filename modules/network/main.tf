
###########################  WTW Virtual Network Dev Environment #####################################################

resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnetname
  address_space       = var.address_space_vnet
  location            = var.location
  resource_group_name = var.res_group

}

########################### Subnets   #####################################################
# 1. Application Subnet
# 2. Web Subnet
# 3. DB Subnet

resource "azurerm_subnet" "web-subnet" {
  name                 = var.websubnetname
  virtual_network_name = azurerm_virtual_network.vnet1.name
  resource_group_name  = var.res_group
  address_prefixes     = [var.websubnetaddressprefix]
  service_endpoints                         = []
}

resource "azurerm_subnet" "app-subnet" {
  name                 = var.appsubnetname
  virtual_network_name = azurerm_virtual_network.vnet1.name
  resource_group_name  = var.res_group
  address_prefixes     = [var.appsubnetaddressprefix]
  service_endpoints                         = []
}

resource "azurerm_subnet" "db-subnet" {
  name                 = var.dbsubnetname
  virtual_network_name = azurerm_virtual_network.vnet1.name
  resource_group_name  = var.res_group
  address_prefixes     = [var.dbsubnetaddressprefix]
  service_endpoints                         = []
}

