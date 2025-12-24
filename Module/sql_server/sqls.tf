resource "azurerm_mssql_server" "sql_server" {
  for_each = var.sql_server
  name                         = each.value.sql_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.sql_version
  administrator_login          = data.azurerm_key_vault_secret.sql_login.value
  administrator_login_password = data.azurerm_key_vault_secret.sql_password.value

}

