module "ResourceGroup" {
  source = "./ResourceGroup"
  resource_group_basename = "TR01"
  resource_group_location = "East US"
}

module "AppService" {
  source = "./AppService/Linux"
  app_service_basename = "linux01"
  app_service_location = "East US"
  app_service_resourceGroupName = data.azurerm_resource_group.TR01.name
}

module "AppServicePlan" {
  source = "./AppServicePlan"
  app_service_plan_location = "East US"
  app_service_plan_resourceGroupName = data.azurerm_resource_group.TR01.name
}