module "abbreviations" {
  source = "../../modules/abbreviations"
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "this" {
  name     = "${module.abbreviations.base.resource_group}-${var.prefix_name}"
  location = var.location
  tags     = var.tags
}

module "storage_account" {
  source = "../../modules/storage_account"

  resource_group_name = azurerm_resource_group.this.name
  prefix_name         = var.prefix_name
  tags                = var.tags

  depends_on = [azurerm_resource_group.this]
}

module "cosmos_db" {
  source = "../../modules/cosmos_db"

  resource_group_name = azurerm_resource_group.this.name
  prefix_name         = var.prefix_name
  tags                = var.tags

  depends_on = [azurerm_resource_group.this]
}

module "function_app" {
  source = "../../modules/function_app"

  resource_group_name  = azurerm_resource_group.this.name
  storage_account_name = module.storage_account.storage_account_name
  prefix_name          = var.prefix_name
  tags                 = var.tags

  depends_on = [module.storage_account]
}
