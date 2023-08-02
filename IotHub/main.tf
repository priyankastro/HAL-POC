# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "West Europe"
# }

# resource "azurerm_storage_account" "example" {
#   name                     = "examplestorage"
#   resource_group_name      = var.iothub_resourceGroupName
#   location                 = azurerm_resource_group.example.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

resource "azurerm_storage_container" "storage_container" {
  name                  = "container-test-999"
  storage_account_name  = var.storage_container_storage_account_name
  container_access_type = "private"
}

# resource "azurerm_eventhub_namespace" "example" {
#   name                = "example-namespace"
#   resource_group_name = var.iothub_resourceGroupName
#   location            = azurerm_resource_group.example.location
#   sku                 = "Basic"
# }

resource "azurerm_eventhub" "eventhub" {
  name                = var.eventhub_name
  resource_group_name = var.iothub_resourceGroupName
  namespace_name      = var.eventhub_namespace_name
  partition_count     = var.eventhub_namespace_partition_count
  message_retention   = var.eventhub_namespace_message_retention
}

resource "azurerm_eventhub_authorization_rule" "eventhub_authorization_rule" {
  resource_group_name = var.iothub_resourceGroupName
  namespace_name      = var.eventhub_namespace_name
  eventhub_name       = azurerm_eventhub.eventhub.name
  name                = var.eventhub_authorization_rule_name
  send                = var.eventhub_authorization_rule_send
}

resource "azurerm_iothub" "iothub" {
  name                = var.iothub_name
  resource_group_name = var.iothub_resourceGroupName
  location            = var.iothub_location

  sku {
    name     = "B1"
    capacity = "1"
  }

  # endpoint {
  #   type                       = "AzureIotHub.StorageContainer"
  #   connection_string          = var.primary_blob_connection_string
  #   name                       = "export"
  #   batch_frequency_in_seconds = 60
  #   max_chunk_size_in_bytes    = 10485760
  #   container_name             = azurerm_storage_container.storage_container.name
  #   encoding                   = "Avro"
  #   file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
  # }

  # endpoint {
  #   type              = "AzureIotHub.EventHub"
  #   connection_string = azurerm_eventhub_authorization_rule.eventhub_authorization_rule.primary_connection_string
  #   name              = "export2"
  # }

  # route {
  #   name           = "export"
  #   source         = "DeviceMessages"
  #   condition      = "true"
  #   endpoint_names = ["export"]
  #   enabled        = true
  # }

  # route {
  #   name           = "export2"
  #   source         = "DeviceMessages"
  #   condition      = "true"
  #   endpoint_names = ["export2"]
  #   enabled        = true
  # }

  # enrichment {
  #   key            = "tenant"
  #   value          = "$twin.tags.Tenant"
  #   endpoint_names = ["export", "export2"]
  # }

  # cloud_to_device {
  #   max_delivery_count = 30
  #   default_ttl        = "PT1H"
  #   feedback {
  #     time_to_live       = "PT1H10M"
  #     max_delivery_count = 15
  #     lock_duration      = "PT30S"
  #   }
  # }

  tags = {
    purpose = "testing"
  }
}