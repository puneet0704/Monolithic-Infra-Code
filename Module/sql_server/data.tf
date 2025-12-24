data "azurerm_key_vault" "kvis" {
  name                = "puneet-key-vault"
  resource_group_name = "rg-puneet"
}

data "azurerm_key_vault_secret" "sql_login" {
  name         = "server-username"
  key_vault_id = data.azurerm_key_vault.kvis.id
}

data "azurerm_key_vault_secret" "sql_password" {
    name        = "server-password"
    key_vault_id = data.azurerm_key_vault.kvis.id
}