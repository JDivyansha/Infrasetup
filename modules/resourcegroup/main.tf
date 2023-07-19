resource "azurerm_resource_group" "resg" {
name        = var.res_group
location    = var.location
tags        =  {
     SupportGroup = "DevDeployment"
            }
}

