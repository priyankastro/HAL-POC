module "RandomStringGenerator" {
  source = "../RandomStringGenerator"
}

# NOTE: the Name needs to be globally unique and only alphanumeric
resource "azurerm_container_registry" "container_registry" {
  name                = "${var.container_registry_name}${module.RandomStringGenerator.out_result}"
  resource_group_name = var.container_registry_resourceGroupName
  location            = var.container_registry_location
  sku                 = var.container_registry_sku

  tags = var.container_registry_tags

  # for Premium SKU
  # admin_enabled       = false
  # georeplications {
  #   location                = "East US"
  #   zone_redundancy_enabled = true
  #   tags                    = {}
  # }
  # georeplications {
  #   location                = "North Europe"
  #   zone_redundancy_enabled = true
  #   tags                    = {}
  # }
}