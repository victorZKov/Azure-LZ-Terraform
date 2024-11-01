# BU-UI

## File Share Module

This module creates a Storage account with a File Share configured and assigns RBAC roles to a given list of users.

### Usage

```hcl
module "file_share" {
  source              = "./modules/file-share"
  storage_account_name = "mystorageaccount"
  resource_group_name  = "myresourcegroup"
  users                = ["user1@example.com", "user2@example.com"]
}
```

### Inputs

| Name                  | Description                             | Type   | Default | Required |
|-----------------------|-----------------------------------------|--------|---------|----------|
| storage_account_name  | The name of the Storage account         | string | n/a     | yes      |
| resource_group_name   | The name of the resource group          | string | n/a     | yes      |
| users                 | List of users to assign RBAC roles      | list   | n/a     | yes      |

### Outputs

| Name                  | Description                             |
|-----------------------|-----------------------------------------|
| storage_account_name  | The name of the Storage account         |
| file_share_url        | The URL of the File Share               |

For more details, see the [File Share Module](./modules/file-share).
