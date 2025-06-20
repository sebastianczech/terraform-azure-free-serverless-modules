# Azure Container Apps Module

This Terraform module creates an Azure Container App and its environment, utilizing the free tier resources.

## Features

- Creates a Container App Environment
- Deploys a container app with configurable resources
- Integrated with Log Analytics for monitoring
- Free tier eligible configuration by default

## Usage

```hcl
module "container_app" {
  source = "./modules/container_app"

  name                       = "my-container-app"
  environment_name          = "my-container-env"
  location                  = "westeurope"
  resource_group_name       = "my-resource-group"
  log_analytics_workspace_id = "workspace-id"

  container_name  = "myapp"
  container_image = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"

  tags = {
    Environment = "Development"
  }
}
```

## Free Tier Limitations

The free tier includes:
- 750,000 vCPU-seconds per month
- 1.5GB-seconds memory per month
- 2GB storage

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
| [azurerm_container_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app) | resource |
| [azurerm_container_app_environment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app_environment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | The container image to deploy | `string` | n/a | yes |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | The name of the container | `string` | n/a | yes |
| <a name="input_cpu_cores"></a> [cpu\_cores](#input\_cpu\_cores) | The number of CPU cores to allocate to the container | `number` | `0.5` | no |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | The name of the Container App Environment | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Container App should be created | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace to use for logging | `string` | n/a | yes |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | The amount of memory to allocate to the container in GB | `string` | `"1Gi"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Container App | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Container App | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_environment_id"></a> [environment\_id](#output\_environment\_id) | The ID of the Container App Environment |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Container App |
| <a name="output_latest_revision_name"></a> [latest\_revision\_name](#output\_latest\_revision\_name) | The name of the latest revision of the Container App |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
