# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account
resource "azurerm_cosmosdb_account" "db" {
  name                = var.account_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  public_network_access_enabled = false
  local_authentication_disabled = true

  network_acl_bypass_for_azure_services = true
  is_virtual_network_filter_enabled     = true

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = data.azurerm_resource_group.rg.location
    failover_priority = 0
  }

  capabilities {
    name = "EnableServerless"
  }

  capacity {
    total_throughput_limit = 1000 # Free tier limit
  }

  tags = var.tags
}
