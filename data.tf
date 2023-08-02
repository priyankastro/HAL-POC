data "azurerm_resource_group" "TR01" {
  name = "rg-TR01-EastUS"
}

# data "azurerm_mssql_server" "example" {
#   name                = "existingMsSqlServer"
#   resource_group_name = "existingResGroup"
# }

data "azurerm_storage_account" "storageaccountvec6ck" {
  name                = "storageaccountvec6ck"
  resource_group_name = "rg-TR01-EastUS"
}

data "azurerm_eventhub_namespace" "ehub-test-999-tf" {
  name                = "ehub-test-999-tf"
  resource_group_name = "rg-TR01-EastUS"
}