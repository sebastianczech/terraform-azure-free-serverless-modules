# Azure Monitor Module

This Terraform module creates Azure Monitor resources including action groups and metric alerts, utilizing the free tier features.

## Features

- Creates a Monitor Action Group with email notification
- Supports creating multiple metric alerts
- Configurable alert criteria
- Free tier eligible monitoring features

## Usage

```hcl
module "monitor" {
  source = "./modules/monitor"

  name                = "my-action-group"
  resource_group_name = "my-resource-group"
  short_name          = "myalerts"
  
  email_receiver_name    = "admin"
  email_receiver_address = "admin@example.com"

  metric_alerts = [
    {
      name            = "high-cpu-alert"
      scopes          = ["/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Web/sites/xxx"]
      description     = "Alert when CPU usage is high"
      metric_namespace = "Microsoft.Web/sites"
      metric_name     = "CpuPercentage"
      aggregation     = "Average"
      operator        = "GreaterThan"
      threshold       = 80
    }
  ]

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
| name | The name of the Monitor Action Group | string | yes |
| resource_group_name | The name of the resource group | string | yes |
| short_name | The short name of the action group | string | yes |
| email_receiver_name | The name of the email receiver | string | yes |
| email_receiver_address | The email address of the receiver | string | yes |
| metric_alerts | List of metric alerts to create | list(object) | no |
| tags | A mapping of tags to assign to the resource | map(string) | no |

## Outputs

| Name | Description |
|------|-------------|
| action_group_id | The ID of the Monitor Action Group |
| metric_alerts | The IDs of the created metric alerts |

## Free Tier Features

Azure Monitor free tier includes:
- Basic metrics and logs
- 5 multi-resource metrics
- Basic log analytics
- Basic application insights
