data "azurerm_network_interface" "net_front" {
  for_each = var.vm_name

  name                = each.value.network_interface_name
  resource_group_name = each.value.rg_name
}
  