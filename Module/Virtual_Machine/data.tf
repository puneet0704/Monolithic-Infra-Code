data "azurerm_network_interface" "net_front" {
  for_each = var.vm

  name                = each.value.network_interface_name
  resource_group_name = each.value.rg_name
}
data "azurerm_key_vault" "kvi" {
  name                = "puneet-key-vault"
  resource_group_name = "rg-puneet"
}

data "azurerm_key_vault_secret" "login" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kvi.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.kvi.id
}