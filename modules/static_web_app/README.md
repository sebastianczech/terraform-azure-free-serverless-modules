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

## Requirements

- Terraform >= 1.0.0
- AzureRM Provider >= 3.0.0

## Providers

| Name    | Version |
|---------|---------|
| azurerm | >= 3.0.0 |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|----------|
| name | The name of the Static Web App | string | yes |
| resource_group_name | The name of the resource group | string | yes |
| location | The Azure region where the Static Web App should be created | string | yes |
| app_settings | A map of app settings to apply to the Static Web App | map(string) | no |
| tags | A mapping of tags to assign to the resource | map(string) | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Static Web App |
| default_host_name | The default host name of the Static Web App |
| api_key | The API key of the Static Web App |

## Free Tier Limitations

The Free tier includes:
- 100GB bandwidth per month
- 2 custom domains
- Built-in CI/CD with GitHub Actions
- Free SSL certificates
- Global CDN distribution
