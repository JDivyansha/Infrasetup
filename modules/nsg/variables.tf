		
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

