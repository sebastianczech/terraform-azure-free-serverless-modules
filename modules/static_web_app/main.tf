module "abbreviations" {
  source = "../../modules/abbreviations"
}

resource "azurerm_static_web_app" "this" {
  name                = "${var.prefix_name}-${module.abbreviations.web.static_web_app}"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku_tier = "Free"

  app_settings = var.app_settings

  tags = var.tags
}
