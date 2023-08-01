module "AppServicePlan" {
  source = "../../AppServicePlan"
  app_service_plan_location = var.app_service_location
  app_service_plan_resourceGroupName = var.app_service_resourceGroupName
}
resource "azurerm_linux_web_app" "linux" {
  name                = "${var.app_service_basename}app"
  resource_group_name = var.app_service_resourceGroupName
  location            = module.AppServicePlan.out_location
  service_plan_id     = module.AppServicePlan.out_id

  site_config {}

  depends_on = [ module.AppServicePlan ]
}