resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.mssql_server_name
  resource_group_name          = var.mssql_server_resourceGroupName
  location                     = var.mssql_server_location
  administrator_login          = var.mssql_server_administrator_login
  administrator_login_password = var.mssql_server_administrator_login_password
  minimum_tls_version          = var.mssql_server_minimum_tls_version
  version = "12.0"
  # azuread_administrator {
  #   login_username = "AzureAD Admin"
  #   object_id      = "00000000-0000-0000-0000-000000000000"
  # }
}