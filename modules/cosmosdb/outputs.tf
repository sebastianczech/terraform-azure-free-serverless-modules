output "cosmos_db_id" {
  description = "The ID of the Cosmos DB account"
  value       = azurerm_cosmosdb_account.db.id
}

output "cosmos_db_endpoint" {
  description = "The endpoint used to connect to the Cosmos DB account"
  value       = azurerm_cosmosdb_account.db.endpoint
}

output "cosmos_db_primary_key" {
  description = "The primary key for the Cosmos DB account"
  value       = azurerm_cosmosdb_account.db.primary_key
  sensitive   = true
}
