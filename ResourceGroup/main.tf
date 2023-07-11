resource "azurerm_resource_group" "rg" {
  name     = "rg-${lower(var.resource_group_name)}-${var.resource_group_location}"
  location = var.resource_group_location
}