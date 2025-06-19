# Azure API Management Module

This Terraform module creates an Azure API Management instance in the Consumption (serverless) tier, which is part of Azure's free services.

## Features

- Creates an API Management instance in the Consumption tier
- System-assigned managed identity enabled by default
- Configurable publisher details
- Tag support

## Usage

```hcl
module "api_management" {
  source = "./modules/api_management"

  name                = "my-api-management"
  location            = "westeurope"
  resource_group_name = "my-resource-group"
  publisher_name      = "My Company"
  publisher_email     = "admin@mycompany.com"

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
| name | The name of the API Management instance | string | yes |
| location | The Azure region where the API Management instance should be created | string | yes |
| resource_group_name | The name of the resource group in which to create the API Management instance | string | yes |
| publisher_name | The name of the publisher/company | string | yes |
| publisher_email | The email of the publisher/company | string | yes |
| tags | A mapping of tags to assign to the resource | map(string) | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the API Management instance |
| gateway_url | The URL of the Gateway for the API Management instance |
| identity | The identity of the API Management instance |

## Free Tier Limitations

The Consumption tier (free) includes:
- Pay-per-action pricing model
- No minimum cost
- Instant provisioning
- Built-in high availability
- Automatic scaling
