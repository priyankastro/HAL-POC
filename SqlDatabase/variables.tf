variable "mssql_database_name" {
  type = string
  description = "Database Name"
}
variable "mssql_database_resourceGroupName" {
  type = string
  description = "Resource Group Name"
}
variable "mssql_database_serverName" {
  type = string
  description = "Server Name"
}
variable "mssql_database_location" {
  type = string
  description = "Location"
}
variable "mssql_database_sku_name" {
  type = string
  description = "SKU Name"
}
variable "mssql_database_max_size_gb" {
  type = number
  description = "Max Size GB"
}
variable "mssql_database_tags" {
  type = map(string)
  description = "Tags"
}