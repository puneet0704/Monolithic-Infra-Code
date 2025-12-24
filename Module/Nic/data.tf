data "azurerm_subnet" "subnets" {
  for_each = var.nic_config

  name                 = each.value.subnet_name
  virtual_network_name = "vnet_puneet"
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "ips" {
  for_each = var.nic_config

  name                = each.value.public_ip_name
  resource_group_name = each.value.rg_name
}