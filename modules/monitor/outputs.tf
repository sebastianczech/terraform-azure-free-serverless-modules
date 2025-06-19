output "action_group_id" {
  description = "The ID of the Monitor Action Group"
  value       = azurerm_monitor_action_group.this.id
}

output "metric_alerts" {
  description = "The IDs of the created metric alerts"
  value       = [for alert in azurerm_monitor_metric_alert.this : alert.id]
}
