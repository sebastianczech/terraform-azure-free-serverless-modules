output "id" {
  description = "The ID of the Static Web App"
  value       = azurerm_static_web_app.this.id
}

output "default_host_name" {
  description = "The default host name of the Static Web App"
  value       = azurerm_static_web_app.this.default_host_name
}

output "api_key" {
  description = "The API key of the Static Web App"
  value       = azurerm_static_web_app.this.api_key
  sensitive   = true
}
