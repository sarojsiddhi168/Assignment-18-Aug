
resource "azurerm_network_interface" "nic1" {
  for_each = var.nic_child

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations

    content {
      name                          = ip_configuration.value.name
      public_ip_address_id          = data.azurerm_public_ip.pip_data[each.key].id
      subnet_id                     = data.azurerm_subnet.subnet_data[ip_configuration.value.subnet_id].id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }
  }
}

data "azurerm_subnet" "subnet_data" {
  for_each = var.subnet_child

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip_data" {
  for_each = var.nic_child

  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

output "nic_ids" {
  value = azurerm_network_interface.nic1
}