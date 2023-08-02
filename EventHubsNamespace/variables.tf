variable "eventhub_namespace_name" {
  type = string
  description = "Eventhub Namespace Name"
}
variable "eventhub_namespace_resourceGroupName" {
  type = string
  description = "Resource Group Name"
}
variable "eventhub_namespace_location" {
  type = string
  description = "Location"
}
variable "eventhub_namespace_capacity" {
  type = number
  description = "Capacity"
}
variable "eventhub_namespace_sku" {
  type = string
  description = "SKU"
}
variable "eventhub_namespace_tags" {
  type = map(string)
  description = "Tags"
}