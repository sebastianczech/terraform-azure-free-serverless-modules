output "resource_group_id" {
  description = "ID of the created resource group"
  value       = azurerm_resource_group.this.id
}

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_location" {
  description = "Location of the created resource group"
  value       = azurerm_resource_group.this.location
}

output "storage_account_id" {
  description = "The ID of the Storage Account"
  value       = module.storage_account.storage_account_id
}

output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = module.storage_account.storage_account_name
}

output "cosmos_db_id" {
  description = "The ID of the Cosmos DB account"
  value       = module.cosmos_db.cosmos_db_id
}

output "cosmos_db_endpoint" {
  description = "The endpoint of the Cosmos DB account"
  value       = module.cosmos_db.cosmos_db_endpoint
}

output "function_app_id" {
  description = "The ID of the Function App"
  value       = module.function_app.function_app_id
}

output "function_app_default_hostname" {
  description = "The default hostname of the Function App"
  value       = module.function_app.function_app_default_hostname
}

output "function_app_outbound_ip_addresses" {
  description = "Outbound IP addresses of the Function App"
  value       = module.function_app.function_app_outbound_ip_addresses
}
