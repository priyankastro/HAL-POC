resource "azurerm_purview_account" "purview_account" {
  name                = var.purview_account_name
  resource_group_name = var.purview_account_resourceGroupName
  location            = var.purview_account_location

  identity {
    type = "SystemAssigned"
  }
}