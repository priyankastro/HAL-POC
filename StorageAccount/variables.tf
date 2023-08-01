variable "storage_account_location" {
  type = string
  description = "Location"
}
variable "storage_account_resourceGroupName" {
  type = string
  description = "Resource Group Name"
}
variable "storage_account_tier" {
  type = string
  description = "Account Tier"
}
variable "storage_account_replication_type" {
  type = string
  description = "Account Replication Type"
}
variable "storage_account_tags" {
  type = map(string)
  description = "Tags"
}