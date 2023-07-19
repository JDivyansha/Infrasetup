variable "res_group" {
description     = "The Name of the resource group."
default         = " "
}

variable "location" {
description     = "The location of thr resource group"
default         = " "
}

variable "availsetname" {
description     = "The location of the availability set"
default         = " "
}

variable "avsetcreate" {
 description = "Whether to create an availability set or not"
  type        = bool
  default     = false
}
variable "vnetname" {
description     = "The Name of the Virtuak nework."
default         = " "
}

variable "address_space_vnet" {
description     = "Address space defined for Virtual network"
default         = " "
}

variable "appsubnetname" {
description     = "The Name of the app subnet."
default         = " "
}
variable "websubnetname" {
description     = "The Name of the web subnet."
default         = " "
}
variable "dbsubnetname" {
description     = "The Name of the db subnet."
default         = " "
}

variable "web_nsgname" {
description     = "The Name of the web nsg."
default         = " "
}
variable "app_nsgname" {
description     = "The Name of the app nsg."
default         = " "
}
variable "db_nsgname" {
description     = "The Name of the db nsg."
default         = " "
}



variable "websubnetaddressprefix" {
description     = "The address prefix of the web tier subnet"
default         = " "
}
variable "appsubnetaddressprefix" {
description     = "The address prefix of the application tier subnet."
default         = " "
}

variable "dbsubnetaddressprefix" {
description     = "The address prefix of the DB tier subnet"
default         = " "
}

variable "linux vms" {
    type = map(object({
    res_group               = string
    vnet_resource_group              = string
    vnet_name                       = string
    subnet_name                     = string
    subscription_id                 = string
    vm_size                         = string
    nic                             = string
    #sku                            = string
    private_ip_addr_allocation      = string

    os_disk_name                    = string
    os_disk_size_gb                 = string
    os_storage_account_type         = string
    enable_accelerated_networking   = string
    storage_account_type            = string
    #avzones                        = number
    zones                           = string
    create_data_disk                = string
	disk_caching_type                           = string
	
####availability set rg and location
    avrgloc                         = string
    rgname                          = string
	availsetname                    = string
    availset                        = string
    avzoneset                       = string

}

variable "res_group" {
description     = "The Name of the resource group."
default         = " "
}

variable "location" {
description     = "The location of thr resource group"
default         = " "
}


variable "pipwebname" {
description     = "Public IP or Web Load bancer"
default         = " "
}

variable "pipappname" {
description     = "Public IP or App Load bancer"
default         = " "
}

variable "app_lb_name" {
description     = "The Name of the app load balancer"
default         = " "
}

variable "web_lb_name" {
description     = "The Name of the app load balancer"
default         = " "
}
variable "appbackendpool" {
description     = "The Name of the app load balancer backendpool"
default         = " "
}

variable "webbackendpool" {
description     = "The Name of the app load balancer backendpool"
default         = " "
}

variable "sqlservername" {
description     = "name of sql server to be created in DB layer"
default         = " "
}

variable "administrator_login" {
description     = "sql server login admin"
default         = " "
}

variable "administrator_password" {
description     = "sql server login password"
default         = " "
}

variable "sqldatabasename" {
description     = "name of sql database to be created in DB layer"
default         = " "
}

