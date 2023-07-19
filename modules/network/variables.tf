		
variable "res_group" {
description     = "The Name of the resource group."
default         = " "
}

variable "location" {
description     = "The location of thr resource group"
default         = " "
}
variable "vnetname" {
description     = "The Name of the Virtuak nework."
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

variable "address_space_vnet" {
description     = "Address space defined for Virtual network"
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