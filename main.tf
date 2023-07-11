resource "azurerm_service_plan" "example" {
  name                = "ASP-rgTR-test"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  sku_name            = "F1"
  os_type             = "Windows"
  depends_on          = [azurerm_resource_group.rg1]
}

resource "azurerm_windows_web_app" "example" {
  name                = "app-test"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
  depends_on = [azurerm_service_plan.example]
}
