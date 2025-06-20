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

## Free Tier Limitations

The Consumption tier (free) includes:
- Pay-per-action pricing model
- No minimum cost
- Instant provisioning
- Built-in high availability
- Automatic scaling

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

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_api_management.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the API Management instance should be created | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the API Management instance | `string` | n/a | yes |
| <a name="input_publisher_email"></a> [publisher\_email](#input\_publisher\_email) | The email of the publisher/company | `string` | n/a | yes |
| <a name="input_publisher_name"></a> [publisher\_name](#input\_publisher\_name) | The name of the publisher/company | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the API Management instance | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway_url"></a> [gateway\_url](#output\_gateway\_url) | The URL of the Gateway for the API Management instance |
| <a name="output_id"></a> [id](#output\_id) | The ID of the API Management instance |
| <a name="output_identity"></a> [identity](#output\_identity) | The identity of the API Management instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
