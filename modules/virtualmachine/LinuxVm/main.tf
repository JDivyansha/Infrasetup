resource "tls_private_key" "key_ssh" {
    algorithm               = "RSA"
    rsa_bits                = 4096
}


data "azurerm_resource_group" "rgds" {
name                    = var.res_group
}

data "azurerm_subnet" "subnet" {
name                    = var.subnet_name
virtual_network_name    = var.vnet_name
resource_group_name     = var.vnet_resource_group
}

data "azurerm_availability_set" "avset"{
    name = var.availsetname
    resource_group_name = var.res_group
}

resource "azurerm_network_interface" "nic" {
    name                                = "${var.servername}-nic"
    location                            = data.azurerm_resource_group.rgds.location
    resource_group_name                 = data.azurerm_resource_group.rgds.name
    enable_accelerated_networking       = var.enable_accelerated_networking
    ip_configuration {
        name                            = "${var.nic}NICconfig"
        subnet_id                       = data.azurerm_subnet.subnet.id
        private_ip_address_allocation   = var.private_ip_addr_allocation
    }
}


locals {
    avvaluecheck    = var.availset == "true" ? data.azurerm_availability_set.avset.id : null
    avzoneset       = var.avzoneset == "true" ? "true" : "false"

    avzonesval      = local.avzoneset == "true" ? var.zones : null
    zones           = local.avzoneset == "true" ? var.zones : null
    count           = var.availset ? 1 : 0
    availsetval     = var.availset == "true" ? local.avvaluecheck : null
}



resource "azurerm_linux_virtual_machine" "vm" {
    name                            = var.servername
    location                        = data.azurerm_resource_group.rgds.location
    resounce_group_name             = data.azurerm_resource_group.rgds.name

    size                            = var.vm_size
    zone                            = local.avzonesval
    admin_username                  = var.admin_username
    admin_password                  = var.admin_password
    availability_set_id             = local.availsetval
    disable_password_authentication = "true"
	
	storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
    admin_ssh_key {
        username                    = var.admin_username
        public_key                  = tls_private_key.key_ssh.public_key_openssh
    }
    network_interface_ids           = [azurerm_network_interface.nic.id]
    os_disk {
        name                        = "${var.servername}-${var.os_disk_name}"
        caching                     = var.disk_caching_type
        storage_account_type        = var.storage_account_type
        disk_size_gb                = var.os_disk_size_gb
    }
  
    tags    = var.tags
}
