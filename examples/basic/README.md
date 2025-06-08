# Basic example

This example demonstrates how to use all 4 modules together to create a complete Azure serverless infrastructure:

1. **Resource Group** - The foundation container for all resources
2. **Storage Account** - Required for Azure Functions and general blob storage
3. **Cosmos DB** - NoSQL database for storing application data
4. **Function App** - Serverless compute platform for running code

## Architecture

The example creates:
- A resource group to contain all resources
- A storage account with security best practices (private endpoints, no public access)
- A Cosmos DB account with private networking and authentication
- An Azure Function App (Linux) connected to the storage account
- An App Service Plan to host the Function App

All resources are named using the abbreviations module for consistency.

## Usage

1. Copy `example.tfvars` to `terraform.tfvars` and update the values:
   ```bash
   cp example.tfvars terraform.tfvars
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Plan the deployment:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_abbreviations"></a> [abbreviations](#module\_abbreviations) | ../../modules/abbreviations | n/a |
| <a name="module_cosmos_db"></a> [cosmos\_db](#module\_cosmos\_db) | ../../modules/cosmos_db | n/a |
| <a name="module_function_app"></a> [function\_app](#module\_function\_app) | ../../modules/function_app | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage_account | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure region where resources will be created | `string` | n/a | yes |
| <a name="input_prefix_name"></a> [prefix\_name](#input\_prefix\_name) | Prefix for resource names | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cosmos_db_endpoint"></a> [cosmos\_db\_endpoint](#output\_cosmos\_db\_endpoint) | The endpoint of the Cosmos DB account |
| <a name="output_cosmos_db_id"></a> [cosmos\_db\_id](#output\_cosmos\_db\_id) | The ID of the Cosmos DB account |
| <a name="output_function_app_default_hostname"></a> [function\_app\_default\_hostname](#output\_function\_app\_default\_hostname) | The default hostname of the Function App |
| <a name="output_function_app_id"></a> [function\_app\_id](#output\_function\_app\_id) | The ID of the Function App |
| <a name="output_function_app_outbound_ip_addresses"></a> [function\_app\_outbound\_ip\_addresses](#output\_function\_app\_outbound\_ip\_addresses) | Outbound IP addresses of the Function App |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | ID of the created resource group |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | Location of the created resource group |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Name of the created resource group |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | The ID of the Storage Account |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the Storage Account |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
