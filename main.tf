# module "resourceGroup" {
#   source = "./ResourceGroup"
#   resource_group_name = var.resource_group_name
#   resource_group_location = var.resource_group_location
# }

# import {
#   to = azurerm_resource_group.rg
#   id = "/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourceGroups/rg-TR"
# }
# resource "azurerm_resource_group" "rg" {
#   name     = "rg-TR"
#   location = "eastus"
# }

module "resourceGroup" {
  source = "./AppService/Windows"
}