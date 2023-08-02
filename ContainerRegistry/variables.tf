variable "container_registry_name" {
  type = string
  description = "Container Registry Name"
}
variable "container_registry_sku" {
  type = string
  description = "SKU"
}
variable "container_registry_resourceGroupName" {
  type = string
  description = "Resource Group Name"
}
variable "container_registry_location" {
  type = string
  description = "Location"
}
variable "container_registry_tags" {
  type = map(string)
  description = "Tags"
}