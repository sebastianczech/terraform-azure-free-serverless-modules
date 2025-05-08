# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = false
  public_network_access_enabled   = false

  blob_properties {
    delete_retention_policy {
      days = 7 # Minimum retention for free tier
    }
  }

  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 7 # Minimum retention for free tier
    }
  }

  tags = var.tags
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan
resource "azurerm_service_plan" "plan" {
  name                = var.app_service_plan_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "Y1" # Consumption plan for free tier
  tags                = var.tags
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app
resource "azurerm_linux_function_app" "function" {
  name                       = var.function_app_name
  resource_group_name        = data.azurerm_resource_group.rg.name
  location                   = data.azurerm_resource_group.rg.location
  storage_account_name       = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key
  service_plan_id            = azurerm_service_plan.plan.id

  https_only                    = true
  public_network_access_enabled = false

  site_config {
    application_stack {
      python_version = "3.11" # Latest supported Python version
    }
    minimum_tls_version = "1.2"
  }

  tags = var.tags
}
