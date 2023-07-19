
data "azurerm_subnet" "websubnet" {
  name                 = var.websubnetname
  virtual_network_name = var.vnetname
  resource_group_name  = var.resgroup
}
data "azurerm_subnet" "appsubnet" {
  name                 = var.appsubnetname
  virtual_network_name = var.vnetname
  resource_group_name  = var.resgroup
}
data "azurerm_subnet" "dbsubnet" {
  name                 = var.dbsubnetname
  virtual_network_name = var.vnetname
  resource_group_name  = var.resgroup
}

resource "azurerm_network_security_group" "web-nsg" {
  name                = var.web_nsgname
  location            = var.location
  resource_group_name = var.res_group
  
  security_rule {
    name                       = "ssh-rule-1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  }
  
  security_rule {
    name                       = "ssh-rule-2"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_address_prefix      = "192.168.3.0/24"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
}
}

resource "azurerm_subnet_network_security_group_association" "web-nsg-subnet" {
  subnet_id                 = data.azurerm_subnet.websubnet.id
  network_security_group_id = azurerm_network_security_group.web-nsg.id
}


resource "azurerm_network_security_group" "app-nsg" {
    name =  var.app_nsgname
    location = var.location
    resource_group_name = var.res_group

    security_rule {
        name = "ssh-rule-1"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "22"
    }
    
    security_rule {
        name = "ssh-rule-2"
        priority = 101
        direction = "Outbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "22"
    }
}

resource "azurerm_subnet_network_security_group_association" "app-nsg-subnet" {
  subnet_id                 =  data.azurerm_subnet.appsubnet.id
  network_security_group_id = azurerm_network_security_group.app-nsg.id
}


resource "azurerm_network_security_group" "db-nsg" {
    name = var.db_nsgname
    location = var.location
    resource_group_name = var.resource_group

    security_rule {
        name = "ssh-rule-1"
        priority = 101
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.2.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3306"
    }
    
    security_rule {
        name = "ssh-rule-2"
        priority = 102
        direction = "Outbound"
        access = "Allow"
        protocol = "Tcp"
        source_address_prefix = "192.168.2.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3306"
    }
    
    security_rule {
        name = "ssh-rule-3"
        priority = 100
        direction = "Outbound"
        access = "Deny"
        protocol = "Tcp"
        source_address_prefix = "192.168.1.0/24"
        source_port_range = "*"
        destination_address_prefix = "*"
        destination_port_range = "3306"
    }
}

resource "azurerm_subnet_network_security_group_association" "db-nsg-subnet" {
  subnet_id                 =  data.azurerm_subnet.dbsubnet.id
  network_security_group_id = azurerm_network_security_group.db-nsg.id
}