module "AppServicePlan" {
  source = "../../AppServicePlan"
  location = var.location
  resourceGroupName = var.resourceGroupName
}
resource "azurerm_linux_web_app" "linux" {
  name                = "${var.basename}app"
  resource_group_name = var.resourceGroupName
  location            = module.AppServicePlan.location
  service_plan_id     = module.AppServicePlan.id

  site_config {}

  depends_on = [ module.AppServicePlan ]
}