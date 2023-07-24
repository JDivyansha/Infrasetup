data "azurerm_lb" "web_lb"{
     name                =  var.web_lb_name
     resource_group_name = var.res_group
}

data "azurerm_linux_virtual_machine" "webvm"{
    name = "webvm1"
    resource_group_name = var.res_group
}

data "azurerm_lb" "app_lb"{
     name                =  var.app_lb_name
     resource_group_name = var.res_group
}

data "azurerm_linux_virtual_machine" "appvm"{
    name = "appvm1"
    resource_group_name = var.res_group
}

