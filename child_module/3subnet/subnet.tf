resource "azurerm_subnet" "subnet1" {
  for_each = var.subnet_child

  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.subnet_prefixes
}



# data "azurerm_subnet" "subnet1" {
#   name                 = "backend"
#   virtual_network_name = "production"
#   resource_group_name  = "networking"
# }



# data "azurerm_public_ip" "example" {
#   name                = "name_of_public_ip"
#   resource_group_name = "name_of_resource_group"
# }