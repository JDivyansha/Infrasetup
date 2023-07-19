variable "servername" {
    description         = "The Name of the Server"
    default             = " "
}

variable "avsetcreate" {
    description         = "Check whether availability set is created or to create"
    default             = " "
}


variable "enable_accelerated_networking" {
    description         = "Enable/Disable Network Accelerator"
    default             = " "
}

variable "AvailabilitySet" {
    type    = map(object({
        availsetname    = string
        rgnameloc       = string
        ngname          = string

    }))
    default             = " "
}

variable "rgnameloc" {
    description         = "The region where availability set to be create"
    default             = " "
}
variable "rgname" {
    description = "The Resource Groupname for availability set"
    default             = " "
}

variable "availability_set_id" {
    description         = "avadiability set id"
    default             = " "
}

variable "avzones" {
    description         = "Availability zone for the resource to be created in/"
    default             = null
}

variable "zones" {
    description         = "list of Availability zones where managed disk exists/"
    default             = " "
}


variable "availset" {
    description         = "The Resource Group for the virtual machine resources"
    default             = " "
}
variable "avzoneset" {
    description         = "The Resource Group for the virtual machine resources"
    default             = " "
}


variable "os_disk_res_id" {
    description         = "The sku of the Server"
    default             = " "
}


variable "availsetname" {
    description         = "The name of availibility set."
    default             = " "
}

variable "res_group"{
    description         = "The Resource Group for the virtual machine resources"
    default             = " "
}

variable "name" {
    description         = "The Resource Group for the virtual machine resources"
    default             = " "
}

variable "resource_group_name" {
    description         = "The Resource Group for the virtual machine resources"
    default             = " "
}

variable "vnet_resource_group" {
    description         = "The Resource Group for the Virtual Network resources."
    default             = " "
}

variable "vnet_name" {
    description         = "The name of the virtual network"
    default             = " "
}

variable "subnet_name" {
    description         = "the name of the subnet"
    default             = " "
}


variable "vm_size"  {
    description         = "Virtual machine size."
    default             = " "
}

variable "nic" {
    description         = "Network interface name"
    default             = " "
}

variable "private_ip_addr_allocation" {
    description         = "Specifies if private ip address allocation is dynamic or static"
    default             = " "
}
variable "disk_caching_type" {
    description         = "Enables chose caching type"
    type                = string
    default             = "Readwrite"
}

variable "os_disk_name" {
    description         = "Name of os disk"
    default             = " "
}

variable "os_disk_size_gb" {
    description         = "Enables data disk creation"
    type                = number
}

variable "os_storage_account_type" {
    description         = "OS Disk storage sku"
    default             = " "
}
variable "subscription_id" {
    description         = "Subscription id"
    default             = " "
}



variable "admin_username" {
    description         = "Admin username used in VM creation"
    type                = string
    default             = true
}

variable "admin_password" {
    description         = "Admin password used in VM creation"
    type                = string
    default             = true
}

/*variable "create_data_disk" {
    description         = "Enables data disk creation"
    type                = string
    default             = true
} */
variable "os_storage_account_type" {
    description         = "OS Disk storage sku"
    default             = " "
}


variable "os_disk_id" {
    description         = "The Storage account name to be used for cache"
    default             = " "
}

