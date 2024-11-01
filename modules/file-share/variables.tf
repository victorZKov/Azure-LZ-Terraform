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
