# Azure Cosmos DB Module

This module provisions an Azure Cosmos DB account in serverless mode with free tier capabilities.

## Features

- Serverless capacity mode
- Free tier capabilities
- Single region deployment
- Session consistency level
- Standard MongoDB API

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
| [azurerm_cosmosdb_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix_name"></a> [prefix\_name](#input\_prefix\_name) | The prefix for the name of the Cosmos DB account | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cosmos_db_endpoint"></a> [cosmos\_db\_endpoint](#output\_cosmos\_db\_endpoint) | The endpoint used to connect to the Cosmos DB account |
| <a name="output_cosmos_db_id"></a> [cosmos\_db\_id](#output\_cosmos\_db\_id) | The ID of the Cosmos DB account |
| <a name="output_cosmos_db_primary_key"></a> [cosmos\_db\_primary\_key](#output\_cosmos\_db\_primary\_key) | The primary key for the Cosmos DB account |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
