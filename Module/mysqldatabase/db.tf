resource "azurerm_mssql_database" "database" {
  for_each = var.db
  name         = each.value.db_name
  server_id    = data.azurerm_mssql_server.sql_s_id.id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.size_gb
  sku_name     = each.value.sku_name
}
