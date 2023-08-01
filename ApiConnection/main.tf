data "azurerm_managed_api" "managed_api" {
  name     = "servicebus"
  location = var.api_connection_location
}

resource "azurerm_servicebus_namespace" "servicebus_namespace" {
  name                = var.servicebus_namespace_name
  location            = var.api_connection_location
  resource_group_name = var.api_connection_resourceGroupName
  sku                 = var.servicebus_namespace_sku
}

resource "azurerm_api_connection" "api_connection" {
  name                = var.api_connection_name
  resource_group_name = var.api_connection_resourceGroupName
  managed_api_id      = data.azurerm_managed_api.managed_api.id
  display_name        = var.api_connection_display_name

  parameter_values = {
    connectionString = azurerm_servicebus_namespace.servicebus_namespace.default_primary_connection_string
  }

  tags = var.api_connection_tags

  lifecycle {
    # NOTE: since the connectionString is a secure value it's not returned from the API
    ignore_changes = [parameter_values]
  }
}
