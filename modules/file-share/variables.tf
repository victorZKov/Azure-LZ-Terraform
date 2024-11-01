variable "storage_account_name" {
  description = "The name of the Storage account"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "users" {
  description = "List of users to assign RBAC roles"
  type        = list(string)
}

variable "allowed_subnets" {
  description = "List of allowed subnets to access the storage account"
  type        = list(string)
}

variable "allowed_ip_addresses" {
  description = "List of allowed IP addresses to access the storage account"
  type        = list(string)
}

variable "defender_enabled" {
  description = "Enable or disable defender for the storage account"
  type        = bool
  default     = false
}

variable "storage_type" {
  description = "The type of storage to create. Options are 'SFTP' or 'FileShare'"
  type        = string
  default     = "FileShare"
}
