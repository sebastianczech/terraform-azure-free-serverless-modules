# Azure Function App Module

This module provisions an Azure Function App with Python runtime in consumption plan mode.

## Features

- Linux-based Function App
- Python 3.11 runtime
- Consumption plan (serverless)
- Standard storage account with LRS replication

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
| [azurerm_linux_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app) | resource |
| [azurerm_service_plan.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | The minimum TLS version to use | `string` | `"1.2"` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The OS type for the Function App | `string` | `"Linux"` | no |
| <a name="input_prefix_name"></a> [prefix\_name](#input\_prefix\_name) | The prefix for the name of the Function App | `string` | n/a | yes |
| <a name="input_python_version"></a> [python\_version](#input\_python\_version) | The version of Python to use | `string` | `"3.11"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name for the Function App | `string` | `"Y1"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name of the storage account | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_app_default_hostname"></a> [function\_app\_default\_hostname](#output\_function\_app\_default\_hostname) | The default hostname of the Function App |
| <a name="output_function_app_id"></a> [function\_app\_id](#output\_function\_app\_id) | The ID of the Function App |
| <a name="output_function_app_outbound_ip_addresses"></a> [function\_app\_outbound\_ip\_addresses](#output\_function\_app\_outbound\_ip\_addresses) | Outbound IP addresses of the Function App |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
