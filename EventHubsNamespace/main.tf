resource "azurerm_eventhub_namespace" "eventhub_namespace" {
  name                = var.eventhub_namespace_name
  location            = var.eventhub_namespace_location
  resource_group_name = var.eventhub_namespace_resourceGroupName
  sku                 = var.eventhub_namespace_sku
  capacity            = var.eventhub_namespace_capacity

  tags = var.eventhub_namespace_tags
}