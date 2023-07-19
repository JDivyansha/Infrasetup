 ###RG Variables
 res_group = "devsetup"
 location = "eastus2"

 ##Network Variables
 vnetname = "vnet1"
 address_space_vnet = "10.0.0.0/16"
 websubnetaddressprefix = "10.0.1.0/24"
 appsubnetaddressprefix = "10.0.2.0/24"
 dbsubnetaddressprefix = "10.0.3.0/24"
 availsetname = "avset01"
 websubnetname = "websubnet"
 appsubnetname = "appsubnet"
 dbsubnetname = "dbsubnet"

 ## Load Balancer Variables
 pipwebname  = "my-public-web-ip"
 pipappname = "my-public-app-ip"
 app_lb_name = "app_lb"
 web_lb_name = "web_lb"

 var.webbackendpool = "web-backend-pool"
 var.appbackendpool = "web-backend-pool"
 
 ##Database Variables
var.sqlservername   = "dj-sql-server"
var.administrator_login  = "divyaadmin" 
var.administrator_password= "DivYa@Pass123"
var.sqldatabasename    = "dj-db"   

####NSG Variablles
web_nsgname = "web-nsg-name"
app_nsgname = "app-nsg-name"
dbnsgname = "db-nsg-name"

###Virtual Machine variables
linux_vms = [
  {
    servername              = "web-vm"
	res_group                         			 = "devsetup"
    vnet_resource_group             = "devsetup"
    subscription_id                 = ""
    vnet_name                       = "vnet1"
    subnet_name                     = "web-subnet"
    
    enable_accelerated_networking   = true
    vm_size                         = "Standard_DS1_v2"
    nic                             = "wnic"
    private_ip_addr_allocation      = "Dynamic"
    os_disk_name                    = "os-disk"
    os_disk_size_gb                 = 64
    os_storage_account_type         = "Standard_LRS"
    disk_caching_type               = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    avzoneset                       = "true"
    zones                           = 1
    admin_username                  = divyauser
    admin_password                  = DiVyA@123$
    
    ###### AV SET Variables ####
    availset                        = false
    availsetname                    = null
    rgnameloc                       = "eastus2"
    rgname                          = "devsetup"
	
	},
	
{   
	servername                      = "app-vm"
	res_group                       = "devsetup"
    vnet_resource_group             = "devsetup"
    subscription_id                 = ""
    vnet_name                       = "vnet1"
    subnet_name                     = "app-subnet"
    
    enable_accelerated_networking   = true
    vm_size                         = "Standard_DS1_v2"
    nic                             = "anic"
    private_ip_addr_allocation      = "Dynamic"
    os_disk_name                    = "os-disk"
    os_disk_size_gb                 = 64
    os_storage_account_type         = "Standard_LRS"
    disk_caching_type               = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    avzoneset                       = "true"
    zones                           = 1
    admin_username                  = divyauser
    admin_password                  = DiVyA@123$
    
    ###### AV SET Variables ####
    availset                        = false
    availsetname                    = null
    rgnameloc                       = = "eastus2"
    rgname                          = = "devsetup"
	}
]