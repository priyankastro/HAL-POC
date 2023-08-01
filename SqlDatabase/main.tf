data "azurerm_mssql_server" "mssql_server" {
  name                = var.mssql_database_serverName
  resource_group_name = var.mssql_database_resourceGroupName
}

resource "azurerm_mssql_database" "mssql_database" {
  name           = var.mssql_database_name
  server_id      = data.azurerm_mssql_server.mssql_server.id
  # collation      = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb    = var.mssql_database_max_size_gb
  sku_name       = var.mssql_database_sku_name

  tags = var.mssql_database_tags
}