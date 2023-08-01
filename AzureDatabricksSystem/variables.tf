variable "databricks_workspace_name" {
  type = string
  description = "Databricks Workspace Name"
}
variable "databricks_workspace_sku" {
  type = string
  description = "SKU"
}
variable "databricks_workspace_resourceGroupName" {
  type = string
  description = "Resource Group Name"
}
variable "databricks_workspace_location" {
  type = string
  description = "Location"
}
variable "databricks_workspace_tags" {
  type = map(string)
  description = "Tags"
}