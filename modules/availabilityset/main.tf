resource "azurerm_availability_set" "availset" {
name                = var.availsetname
location            = var.location
resource_group_name = var.res_group
}
