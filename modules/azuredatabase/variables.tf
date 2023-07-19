variable "res_group" {
description     = "The Name of the resource group."
default         = " "
}

variable "location" {
description     = "The location of thr resource group"
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


