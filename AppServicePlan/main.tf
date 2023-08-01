module "RandomStringGenerator" {
  source = "../RandomStringGenerator"
}

resource "azurerm_service_plan" "service_plan" {
  name                = "appserviceplan${module.RandomStringGenerator.out_result}"
  resource_group_name = var.app_service_plan_resourceGroupName
  location            = var.app_service_plan_location
  os_type             = "Linux"
  sku_name            = "B1"
}
