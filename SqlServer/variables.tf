variable "mssql_server_name" {
  type = string
  description = "Server Name"
}
variable "mssql_server_location" {
  type = string
  description = "Location"
}
variable "mssql_server_resourceGroupName" {
  type = string
  description = "Resource Group Name"
}
variable "mssql_server_administrator_login" {
  type = string
  description = "Admin Login User"
}
variable "mssql_server_administrator_login_password" {
  type = string
  description = "Admin Login Password"
}
variable "mssql_server_minimum_tls_version" {
  type = string
  description = "Minimum TLS Version"
}
# variable "mssql_server_tags" {
#   type = map(string)
#   description = "Tags"
# }