

# Create an Azure SQL Server
resource "azurerm_sql_server" "sqlserver" {
  name                         = var.sqlservername
  resource_group_name = var.res_group
  location            = var.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password

# Create an Azure SQL Database
resource "azurerm_sql_database" "sqldb" {
  name                = var.sqldatabasename 
  resource_group_name = var.res_group
  location            = var.location
  server_name         = azurerm_sql_server.sqlserver.name
  edition             = "GeneralPurpose"
  compute_model       = "Serverless"
  min_capacity        = 1
  max_capacity        = 2
  auto_pause_delay     = 60
}

# Output the connection string for the Azure SQL Database
output "sql_connection_string" {
  value = azurerm_sql_database.example.connection_strings[0].connection_string
}

