module "RandomStringGenerator" {
  source = "../RandomStringGenerator"
}

# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "redis_cache" {
  name                = "redis-cache-${module.RandomStringGenerator.out_result}"
  location            = var.redis_cache_location
  resource_group_name = var.redis_cache_resourceGroupName
  capacity            = var.redis_cache_capacity
  family              = var.redis_cache_family
  sku_name            = var.redis_cache_sku_name
  # enable_non_ssl_port = false
  minimum_tls_version = var.redis_cache_minimum_tls_version

  redis_configuration {
  }
}
