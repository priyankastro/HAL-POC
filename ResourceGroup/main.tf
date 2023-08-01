resource "azurerm_resource_group" "resource_group" {
  name = "rg-${var.resource_group_basename}-${replace(var.resource_group_location, " ", "")}"
  location = var.resource_group_location
}