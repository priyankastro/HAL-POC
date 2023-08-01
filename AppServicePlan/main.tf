resource "random_string" "random" {
  length = 6
  special = false
  upper = false
}

resource "azurerm_service_plan" "sp" {
  name                = "appserviceplan${random_string.random.result}"
  resource_group_name = var.resourceGroupName
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}
