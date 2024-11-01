provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "file_share" {
  name                 = "fileshare"
  storage_account_name = azurerm_storage_account.storage_account.name
  quota                = 50
}

resource "azurerm_role_assignment" "rbac" {
  for_each             = toset(var.users)
  scope                = azurerm_storage_account.storage_account.id
  role_definition_name = "Storage File Data SMB Share Contributor"
  principal_id         = each.value
}