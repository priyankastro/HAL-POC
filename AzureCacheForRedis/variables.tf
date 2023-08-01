variable "redis_cache_resourceGroupName" {
  type = string
  description = "Resource Group Name"
}
variable "redis_cache_location" {
  type = string
  description = "Location"
}
variable "redis_cache_family" {
  type = string
  description = "Family"
}
variable "redis_cache_capacity" {
  type = number
  description = "Capacity"
}
variable "redis_cache_sku_name" {
  type = string
  description = "SKU Name"
}
variable "redis_cache_minimum_tls_version" {
  type = string
  description = "Minimum TLS Version"
}

