resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

data "azurerm_managed_api" "example" {
  name     = "servicebus"
  location = azurerm_resource_group.example.location
}

resource "azurerm_servicebus_namespace" "example" {
  name                = "acctestsbn-conn-example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Basic"
}

resource "azurerm_api_connection" "example" {
  name                = "example-connection"
  resource_group_name = azurerm_resource_group.example.name
  managed_api_id      = data.azurerm_managed_api.example.id
  display_name        = "Example 1"

  parameter_values = {
    connectionString = azurerm_servicebus_namespace.example.default_primary_connection_string
  }

  tags = {
    Hello = "World"
  }

  lifecycle {
    # NOTE: since the connectionString is a secure value it's not returned from the API
    ignore_changes = ["parameter_values"]
  }
}
