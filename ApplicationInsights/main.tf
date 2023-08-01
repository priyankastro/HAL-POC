resource "azurerm_application_insights" "application_insights" {
  name                = var.application_insights_name
  location            = var.application_insights_location
  resource_group_name = var.application_insights_resourceGroupName
  application_type    = var.application_insights_application_type
}

output "instrumentation_key" {
  value = azurerm_application_insights.application_insights.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.application_insights.app_id
}