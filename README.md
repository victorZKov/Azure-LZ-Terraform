# BU-UI

## File Share Module

This module creates a Storage account with a File Share configured and assigns RBAC roles to a given list of users.

### Usage

```hcl
module "file_share" {
  source               = "./modules/file-share"
  storage_account_name = "mystorageaccount"
  resource_group_name  = "myresourcegroup"
  users                = ["user1@example.com", "user2@example.com"]
  allowed_subnets      = ["subnet1", "subnet2"]
  allowed_ip_addresses = ["192.168.1.1", "192.168.1.2"]
  defender_enabled     = true
}
```

### Inputs

| Name                  | Description                             | Type   | Default | Required |
|-----------------------|-----------------------------------------|--------|---------|----------|
| storage_account_name  | The name of the Storage account         | string | n/a     | yes      |
| resource_group_name   | The name of the resource group          | string | n/a     | yes      |
| users                 | List of users to assign RBAC roles      | list   | n/a     | yes      |
| allowed_subnets       | List of allowed subnets to access the storage account | list   | n/a     | yes      |
| allowed_ip_addresses  | List of allowed IP addresses to access the storage account | list   | n/a     | yes      |
| defender_enabled      | Enable or disable defender for the storage account | bool   | false   | no       |

### Outputs

| Name                  | Description                             |
|-----------------------|-----------------------------------------|
| storage_account_name  | The name of the Storage account         |
| file_share_url        | The URL of the File Share               |
| defender_status       | The status of the defender configuration|
