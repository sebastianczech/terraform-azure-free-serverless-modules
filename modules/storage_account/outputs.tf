output "storage_account_id" {
  description = "The ID of the Storage Account"
  value       = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = azurerm_storage_account.this.name
}

output "storage_account_primary_access_key" {
  description = "The primary access key of the Storage Account"
  value       = azurerm_storage_account.this.primary_access_key
}
