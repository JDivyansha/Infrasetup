
data "azurerm_linux_virtual_machine" "appvm"{
    name = "appvm1"
    resource_group_name = var.res_group
}

resource "azurerm_virtual_machine_extension" "app_db_extension" {
  name                 = "app-db-extension"
  virtual_machine_id   = data.azurerm_virtual_machine.appvm.id
  resource_group_name  = var.res_group
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
        "commandToExecute": "sudo apt-get update && sudo apt-get install -y mysql-client"
    }
  SETTINGS
}

# Configure database connection string in the application tier
resource "azurerm_virtual_machine_extension" "app_db_connection" {
  name                 = "app-db-connection"
  virtual_machine_id   = azurerm_virtual_machine.appvm.id
  resource_group_name  = var.res_group
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
        "commandToExecute": "echo 'export DB_CONNECTION_STRING=<YOUR_DATABASE_CONNECTION_STRING>' >> /etc/environment"
    }
  SETTINGS
}