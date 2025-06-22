# Azure Static Web App Module

This Terraform module creates an Azure Static Web App in the Free tier.

## Features

- Creates a Static Web App in the Free tier
- Configurable app settings
- Built-in support for CI/CD with GitHub Actions
- Free SSL certificates
- Custom domains support (up to 2 in free tier)

## Usage

```hcl
module "static_web_app" {
  source = "./modules/static_web_app"

  name                = "my-static-web-app"
  resource_group_name = "my-resource-group"
  location            = "westeurope"

  app_settings = {
    "MY_SETTING" = "value"
  }

  tags = {
    Environment = "Development"
  }
}
```

## Free Tier Limitations

The Free tier includes:
- 100GB bandwidth per month
- 2 custom domains
- Built-in CI/CD with GitHub Actions
- Free SSL certificates
- Global CDN distribution

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_abbreviations"></a> [abbreviations](#module\_abbreviations) | ../../modules/abbreviations | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_static_web_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_web_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | A map of app settings to apply to the Static Web App | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Static Web App should be created | `string` | n/a | yes |
| <a name="input_prefix_name"></a> [prefix\_name](#input\_prefix\_name) | The prefix name for the Static Web App | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Static Web App | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_key"></a> [api\_key](#output\_api\_key) | The API key of the Static Web App |
| <a name="output_default_host_name"></a> [default\_host\_name](#output\_default\_host\_name) | The default host name of the Static Web App |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Static Web App |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
