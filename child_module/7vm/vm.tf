resource "azurerm_virtual_machine" "vm1" {

for_each = var.vm_child

  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.rg_name
  network_interface_ids = [var.nic_parent[each.value.nic_name].id]
  vm_size               = each.value.vm_size


  storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  storage_os_disk {
    name              = each.value.vm_name
    caching           = each.value.caching
    create_option     = each.value.create_option
    managed_disk_type = each.value.managed_disk_type
  }
  os_profile {
    computer_name  = each.value.vm_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
 
}

data "azurerm_network_interface" "nic-data" {
for_each = var.vm_child
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}