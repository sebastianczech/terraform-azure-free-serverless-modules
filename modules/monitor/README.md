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

## Free Tier Features

Azure Monitor free tier includes:
- Basic metrics and logs
- 5 multi-resource metrics
- Basic log analytics
- Basic application insights

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
| [azurerm_monitor_action_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_monitor_metric_alert.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_email_receiver_address"></a> [email\_receiver\_address](#input\_email\_receiver\_address) | The email address of the receiver | `string` | n/a | yes |
| <a name="input_email_receiver_name"></a> [email\_receiver\_name](#input\_email\_receiver\_name) | The name of the email receiver | `string` | n/a | yes |
| <a name="input_metric_alerts"></a> [metric\_alerts](#input\_metric\_alerts) | List of metric alerts to create | <pre>list(object({<br/>    name             = string<br/>    scopes           = list(string)<br/>    description      = string<br/>    metric_namespace = string<br/>    metric_name      = string<br/>    aggregation      = string<br/>    operator         = string<br/>    threshold        = number<br/>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Monitor Action Group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Monitor resources | `string` | n/a | yes |
| <a name="input_short_name"></a> [short\_name](#input\_short\_name) | The short name of the action group. This will be used as the abbreviated name for SMS messages | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_action_group_id"></a> [action\_group\_id](#output\_action\_group\_id) | The ID of the Monitor Action Group |
| <a name="output_metric_alerts"></a> [metric\_alerts](#output\_metric\_alerts) | The IDs of the created metric alerts |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
