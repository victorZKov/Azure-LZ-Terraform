provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = var.storage_type == "SFTP" ? "BlockBlobStorage" : "StorageV2"
}

resource "azurerm_storage_share" "file_share" {
  count                = var.storage_type == "FileShare" ? 1 : 0
  name                 = "fileshare"
  storage_account_name = azurerm_storage_account.storage_account.name
  quota                = 50
}

resource "azurerm_storage_sftp" "sftp" {
  count                = var.storage_type == "SFTP" ? 1 : 0
  name                 = "sftp"
  storage_account_name = azurerm_storage_account.storage_account.name
}

resource "azurerm_role_assignment" "rbac" {
  for_each             = toset(var.users)
  scope                = azurerm_storage_account.storage_account.id
  role_definition_name = "Storage File Data SMB Share Contributor"
  principal_id         = each.value
}

resource "azurerm_storage_account_network_rules" "network_rules" {
  storage_account_name = azurerm_storage_account.storage_account.name
  resource_group_name  = var.resource_group_name

  virtual_network_subnet_ids = var.allowed_subnets
  ip_rules                   = var.allowed_ip_addresses

  default_action = "Deny"
}

resource "azurerm_security_center_storage_defender" "defender" {
  count              = var.defender_enabled ? 1 : 0
  storage_account_id = azurerm_storage_account.storage_account.id
}
