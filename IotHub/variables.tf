# variable "storage_container_name" {
#   type = string
#   description = "Storage Container Name"
# }
variable "storage_container_storage_account_name" {
  type = string
  description = "Storage Container Storage Account Name"
}
# variable "storage_container_access_type" {
#   type = string
#   description = "Storage Container Access Type"
# }
variable "eventhub_name" {
  type = string
  description = "eventhub_name"
}
variable "eventhub_namespace_name" {
  type = string
  description = "eventhub_namespace_name"
}
variable "eventhub_namespace_partition_count" {
  type = number
  description = "eventhub_namespace_partition_count"
}
variable "eventhub_namespace_message_retention" {
  type = number
  description = "eventhub_namespace_message_retention"
}
variable "eventhub_authorization_rule_name" {
  type = string
  description = "eventhub_authorization_rule_name"
}
variable "eventhub_authorization_rule_send" {
  type = bool
  description = "eventhub_authorization_rule_send"
}
variable "iothub_name" {
  type = string
  description = "iothub_name"
}
variable "iothub_resourceGroupName" {
  type = string
  description = "Resource Group Name"
}
variable "iothub_location" {
  type = string
  description = "Location"
}
# variable "iothub_tags" {
#   type = map(string)
#   description = "Tags"
# }
variable "primary_blob_connection_string" {
  type = string
  description = "primary_blob_connection_string"
}