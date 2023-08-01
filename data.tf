data "azurerm_resource_group" "TR01" {
  name = "rg-TR01-EastUS"
}
# data "azurerm_mssql_server" "example" {
#   name                = "existingMsSqlServer"
#   resource_group_name = "existingResGroup"
# }