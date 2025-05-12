module "abbreviations" {
  source = "../../modules/abbreviations"
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account
data "azurerm_storage_account" "this" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.this.name
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan
resource "azurerm_service_plan" "this" {
  name                = "${var.name}-${module.abbreviations.compute.app_service_plan}"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  os_type             = "Linux"
  sku_name            = "Y1" # Consumption plan for free tier
  tags                = var.tags
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app
resource "azurerm_linux_function_app" "this" {
  name                       = "${var.name}-${module.abbreviations.compute.function_app}"
  resource_group_name        = data.azurerm_resource_group.this.name
  location                   = data.azurerm_resource_group.this.location
  storage_account_name       = data.azurerm_storage_account.this.name
  storage_account_access_key = data.azurerm_storage_account.this.primary_access_key
  service_plan_id            = azurerm_service_plan.this.id

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
