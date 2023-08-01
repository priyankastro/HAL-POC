variable "api_connection_name" {
  type = string
  description = "API Connection Name"
}
variable "api_connection_display_name" {
  type = string
  description = "API Connection Display Name"
}
variable "api_connection_resourceGroupName" {
  type = string
  description = "Resource Group Name"
}
variable "api_connection_location" {
  type = string
  description = "Location"
}
variable "servicebus_namespace_name" {
  type = string
  description = "Servicebus Name"
}
variable "servicebus_namespace_sku" {
  type = string
  description = "Servicebus SKU"
}
variable "api_connection_tags" {
  type = map(string)
  description = "Tags"
}
