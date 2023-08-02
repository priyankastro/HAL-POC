variable "eventgrid_system_topic_name" {
  type = string
  description = "Data Factory Name"
}
variable "eventgrid_system_topic_resourceGroupName" {
  type = string
  description = "Resource Group Name"
}
variable "eventgrid_system_topic_location" {
  type = string
  description = "Location"
}
variable "eventgrid_system_topic_source_arm_resource_id" {
  type = string
  description = "Source ARM ResourceId"
}
variable "eventgrid_system_topic_type" {
  type = string
  description = "Topic Type"
}
variable "eventgrid_system_topic_tags" {
  type = map(string)
  description = "Tags"
}