resource "azurerm_container_app_environment" "this" {
  name                       = var.environment_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
}

resource "azurerm_container_app" "this" {
  name                         = var.name
  container_app_environment_id = azurerm_container_app_environment.this.id
  resource_group_name         = var.resource_group_name
  revision_mode               = "Single"

  template {
    container {
      name   = var.container_name
      image  = var.container_image
      cpu    = var.cpu_cores
      memory = var.memory_size

      env {
        name  = "WEBSITES_ENABLE_APP_SERVICE_STORAGE"
        value = "false"
      }
    }
  }

  tags = var.tags
}
