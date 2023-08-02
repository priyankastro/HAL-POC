resource "azurerm_data_factory" "data_factory" {
  name                = var.data_factory_name
  location            = var.data_factory_location
  resource_group_name = var.data_factory_resourceGroupName
}