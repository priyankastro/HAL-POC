module "ResourceGroup" {
  source = "./ResourceGroup"
  basename = "TR01"
  location = "East US"
}

module "AppService" {
  source = "./AppService/Linux"
  basename = "linux01"
  location = "East US"
  resourceGroupName = data.azurerm_resource_group.TR01.name
}