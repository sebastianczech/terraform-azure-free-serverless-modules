output "cosmos_db_id" {
  description = "The ID of the Cosmos DB account"
  value       = azurerm_cosmosdb_account.this.id
}

output "cosmos_db_endpoint" {
  description = "The endpoint used to connect to the Cosmos DB account"
  value       = azurerm_cosmosdb_account.this.endpoint
}

output "cosmos_db_primary_key" {
  description = "The primary key for the Cosmos DB account"
  value       = azurerm_cosmosdb_account.this.primary_key
  sensitive   = true
}
