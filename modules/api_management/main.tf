module "abbreviations" {
  source = "../../modules/abbreviations"
}

resource "azurerm_api_management" "this" {
  name                = "${var.prefix_name}-${module.abbreviations.integration.api_management}"
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email

  sku_name = "Consumption_0" # Free tier

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
