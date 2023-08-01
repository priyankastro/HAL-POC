resource "azurerm_resource_group" "rg" {
  name = "rg-${var.basename}-${replace(var.location, " ", "")}"
  location = var.location
}