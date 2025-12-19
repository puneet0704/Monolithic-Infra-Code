resource "azurerm_mssql_server" "sql_s" {
  for_each = var.sql_server_name
  name                         = each.value.sql_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.sql_version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_password
}

