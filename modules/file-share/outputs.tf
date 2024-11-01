output "storage_account_name" {
  description = "The name of the Storage account"
  value       = azurerm_storage_account.storage_account.name
}

output "file_share_url" {
  description = "The URL of the File Share"
  value       = azurerm_storage_share.file_share.url
}
