output "id" {
  description = "The ID of the API Management instance"
  value       = azurerm_api_management.this.id
}

output "gateway_url" {
  description = "The URL of the Gateway for the API Management instance"
  value       = azurerm_api_management.this.gateway_url
}

output "identity" {
  description = "The identity of the API Management instance"
  value       = azurerm_api_management.this.identity
}
