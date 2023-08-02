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

module "AzureCacheForRedis" {
  source = "./AzureCacheForRedis"
  redis_cache_location = local.eastus
  redis_cache_resourceGroupName = data.azurerm_resource_group.TR01.name
  redis_cache_capacity = 0
  redis_cache_family = "C"
  redis_cache_sku_name = "Basic"
  redis_cache_minimum_tls_version = "1.2"
}

module "AzureDatabricksSystem" {
  source = "./AzureDatabricksSystem"
  databricks_workspace_name = "databricks-01-test"
  databricks_workspace_location = local.eastus
  databricks_workspace_resourceGroupName = data.azurerm_resource_group.TR01.name
  databricks_workspace_sku = "trial"
  databricks_workspace_tags = local.dev_tags
}

module "ContainerRegistry" {
  source = "./ContainerRegistry"
  container_registry_name = "containerRegistry"
  container_registry_resourceGroupName = data.azurerm_resource_group.TR01.name
  container_registry_location = local.eastus
  container_registry_sku = "Basic"
  container_registry_tags = local.dev_tags
}

module "DataFactory" {
  source = "./DataFactory"
  data_factory_name = "df-test-999-tf"
  data_factory_location = local.eastus
  data_factory_resourceGroupName = data.azurerm_resource_group.TR01.name
}

module "EventGridSystemTopic" {
  source = "./EventGridSystemTopic"
  eventgrid_system_topic_name = "eg-test-999-tf"
  eventgrid_system_topic_location = local.eastus
  eventgrid_system_topic_resourceGroupName = data.azurerm_resource_group.TR01.name
  eventgrid_system_topic_source_arm_resource_id = data.azurerm_storage_account.storageaccountvec6ck.id
  eventgrid_system_topic_type = "Microsoft.Storage.StorageAccounts"
  eventgrid_system_topic_tags = local.dev_tags
}

module "EventHubsNamespace" {
  source = "./EventHubsNamespace"
  eventhub_namespace_name = "ehub-test-999-tf"
  eventhub_namespace_resourceGroupName = data.azurerm_resource_group.TR01.name
  eventhub_namespace_location = local.eastus
  eventhub_namespace_sku = "Basic"
  eventhub_namespace_capacity = 1
  eventhub_namespace_tags = local.dev_tags
}