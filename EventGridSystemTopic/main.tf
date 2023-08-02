resource "azurerm_eventgrid_system_topic" "eventgrid_system_topic" {
  name                   = var.eventgrid_system_topic_name
  resource_group_name    = var.eventgrid_system_topic_resourceGroupName
  location               = var.eventgrid_system_topic_location
  source_arm_resource_id = var.eventgrid_system_topic_source_arm_resource_id
  topic_type             = var.eventgrid_system_topic_type
  tags = var.eventgrid_system_topic_tags
}