module "ResourceGroup" {
  source = "./ResourceGroup"
  resource_group_basename = "TR01"
  resource_group_location = "East US"
}

module "AppService" {
  source = "./AppService/Linux"
  app_service_basename = "linux01"
  app_service_location = local.eastus
  app_service_resourceGroupName = data.azurerm_resource_group.TR01.name
}

module "AppServicePlan" {
  source = "./AppServicePlan"
  app_service_plan_location = local.eastus
  app_service_plan_resourceGroupName = data.azurerm_resource_group.TR01.name
}

module "StorageAccount" {
  source = "./StorageAccount"
  storage_account_resourceGroupName = data.azurerm_resource_group.TR01.name
  storage_account_location = local.eastus
  storage_account_tier = "Standard"
  storage_account_replication_type = "LRS"
  storage_account_tags = local.dev_tags
}

module "MSSQLServer" {
  source = "./SqlServer"
  mssql_server_name = "mssql-1111-rgtr"
  mssql_server_resourceGroupName = data.azurerm_resource_group.TR01.name
  mssql_server_location = local.eastus
  mssql_server_administrator_login = "UserTerminator"
  mssql_server_administrator_login_password = "admin@123"
  mssql_server_minimum_tls_version = "1.2"
}

module "SqlDatabse" {
  source = "./SqlDatabase"
  mssql_database_name = "db-newdb01"
  mssql_database_location = local.eastus
  mssql_database_serverName = "mssql-1111-rgtr"
  mssql_database_resourceGroupName = data.azurerm_resource_group.TR01.name
  mssql_database_max_size_gb = 1
  mssql_database_sku_name = "Basic"
  mssql_database_tags = local.dev_tags
}

module "ApiConnection" {
  source = "./ApiConnection"
  api_connection_name = "example-connection-01"
  api_connection_display_name = "Example 1"
  api_connection_location = local.eastus
  api_connection_resourceGroupName = data.azurerm_resource_group.TR01.name
  api_connection_tags = local.dev_tags
  servicebus_namespace_name = "acctestsbn-conn-example"
  servicebus_namespace_sku = "Basic"
}

module "ApplicationInsights" {
  source = "./ApplicationInsights"
  application_insights_name = "tf-test-appinsights"
  application_insights_location = local.eastus
  application_insights_resourceGroupName = data.azurerm_resource_group.TR01.name
  application_insights_application_type = "web"
}