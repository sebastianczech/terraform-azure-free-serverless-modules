module "abbreviations" {
  source = "../../modules/abbreviations"
}

resource "azurerm_monitor_action_group" "this" {
  name                = "${var.prefix_name}-${module.abbreviations.monitoring.monitor_action_group}"
  resource_group_name = var.resource_group_name
  short_name          = var.short_name

  email_receiver {
    name                    = var.email_receiver_name
    email_address           = var.email_receiver_address
    use_common_alert_schema = true
  }

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "this" {
  count = length(var.metric_alerts)

  name                = "${var.prefix_name}-${module.abbreviations.monitoring.monitor_alert}-${var.metric_alerts[count.index].name}"
  resource_group_name = var.resource_group_name
  scopes              = var.metric_alerts[count.index].scopes
  description         = var.metric_alerts[count.index].description

  criteria {
    metric_namespace = var.metric_alerts[count.index].metric_namespace
    metric_name      = var.metric_alerts[count.index].metric_name
    aggregation      = var.metric_alerts[count.index].aggregation
    operator         = var.metric_alerts[count.index].operator
    threshold        = var.metric_alerts[count.index].threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.this.id
  }

  tags = var.tags
}
