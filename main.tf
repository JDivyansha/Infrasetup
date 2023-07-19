module "resourcegroup" {
    source = "./modules/resourcegroup"
    resourcegroup = var.res_group
    location = var.location
}
module "network" {
    source = "./modules/network"
    resourcegroup = var.res_group
    location = var.location
    vnetname = var.vnetname
	address_space_vnet = var.address_space_vnet
	websubnetaddressprefix = var.websubnetaddressprefix
	appsubnetaddressprefix = var.appsubnetaddressprefix
	dbsubnetaddressprefix = var.dbsubnetaddressprefix

}

module "AvailabilitySet" {
    source          = "./modules/availabilityset"
    availsetname    = var.availsetname
    res_group       = var.res_group
    location          = var.location
}


module "LinuxVm" {
source                                      = "./modules/VirtualMachine/LinuxVm"
for_each                                    = var.linux_vms
servername                                  = each.key
res_group                         			 = each.value.res_group
vnet_resource_group                         = each.value.vnet_resource_group
subscription_id                             = each.value.subscription_id
vnet_name                                    = each.value.vnet_name
subnet_name                                 = each.value.subnet_name

enable_accelerated_networking               = each.value.enable_accelerated_networking
vm_size                                     = each.value.vm_size
nic                                         = each.value.nic
private_ip_addr_allocation                  = each.value.private_ip_addr_allocation
os_disk_name                                = each.value.os_disk_name
os_disk_size_gb                             = each.value.os_disk_size_gb
os_storage_account_type                     = each.value.os_storage_account_type
disk_caching_type                           = each.value.disk_caching_type
storage_account_type                        = each.value.storage_account_type
avzoneset                                   = each.value.avzoneset
zones                                       = each.value.zones
admin_username                              = var.admin_username
admin_password                              = var.admin_password

###### AV SET Variables ####
availset                                    = each.value.availset
availsetname                                = each.value.availsetname
rgnameloc                                   = each.value.rgnameloc
rgname                                      = each.value.rgname
}


module "nsg" {
    source          = "./modules/nsg"
    res_group       = var.res_group
    location        = var.location
    web_nsgname     = var.web_nsgname   
    app_nsgname     = var.app_nsgname   
    dbnsgname       = var.dbnsgname     
    websubnetname   = var.websubnetname 
    appsubnetname   = var.appsubnetname 
    dbsubnetname    = var.dbsubnetname  
    vnetname        = var.vnetname

}

module "loadbalancer" {
    source          = "./modules/loadbalancer"
    res_group       = var.res_group
    location        = var.location
    pipwebname      = var.pipwebname  
    web_lb_name     = var.web_lb_name  
    pipappname      = var.pipappname     
    app_lb_name     = var.app_lb_name 
 
}
module "azuredatabase" {
    source          = "./modules/azuredatabase"
    res_group       = var.res_group
    location        = var.location
    sqlservername      = var.sqlservername  
    administrator_login     = var.administrator_login 
    administrator_password     = var.administrator_password   
    sqldatabasename     = var.sqldatabasename
 
}


module "connectwebnapptier" {
    source          = "./modules/connectwebnapptier"
    res_group       = var.res_group
    app_lb_name      = var.app_lb_name  
    web_lb_name    = var.web_lb_name
    appbackendpool     = var.appbackendpool  
    webbackendpool   = var.webbackendpool
     
}

module "connectappndbtier" {
    source          = "./modules/connectappndbtier"
    res_group       = var.res_group
     
}
