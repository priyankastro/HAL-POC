module "RandomStringGenerator" {
  source = "../RandomStringGenerator"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "storageaccount${module.RandomStringGenerator.out_result}"
  resource_group_name      = var.storage_account_resourceGroupName
  location                 = var.storage_account_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  tags = var.storage_account_tags
}
