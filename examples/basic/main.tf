module "abbreviations" {
  source = "../../modules/abbreviations"
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "this" {
  name     = "${module.abbreviations.base.resource_group}-${var.prefix_name}"
  location = var.location
  tags     = var.tags
}
