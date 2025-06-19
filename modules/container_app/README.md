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
| name | The name of the Container App | string | yes |
| environment_name | The name of the Container App Environment | string | yes |
| location | The Azure region where the Container App should be created | string | yes |
| resource_group_name | The name of the resource group in which to create the Container App | string | yes |
| log_analytics_workspace_id | The ID of the Log Analytics workspace to use for logging | string | yes |
| container_name | The name of the container | string | yes |
| container_image | The container image to deploy | string | yes |
| cpu_cores | The number of CPU cores to allocate to the container | number | no |
| memory_size | The amount of memory to allocate to the container | string | no |
| tags | A mapping of tags to assign to the resource | map(string) | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Container App |
| latest_revision_name | The name of the latest revision of the Container App |
| environment_id | The ID of the Container App Environment |

## Free Tier Limitations

The free tier includes:
- 750,000 vCPU-seconds per month
- 1.5GB-seconds memory per month
- 2GB storage
