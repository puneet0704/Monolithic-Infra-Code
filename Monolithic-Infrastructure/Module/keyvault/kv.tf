resource "azurerm_key_vault" "key_Vault" {
  for_each = var.kv_name
  name                        = each.value.kv_name
  location                    = each.value.kv_location
  resource_group_name         = each.value.rg_name
  enabled_for_disk_encryption = each.value.disk_encryption
  tenant_id                   = each.value.tenant_id
  soft_delete_retention_days  = each.value.delete_days
  purge_protection_enabled    = each.value.protection
  sku_name = each.value.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]
    secret_permissions = [
      "Get",
    ]
    storage_permissions = [
      "Get",
    ]
  }
}