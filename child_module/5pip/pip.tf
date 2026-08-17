
# resource "azurerm_public_ip" "pip1" {

#     for_each = var.pip_child
#   name                = each.value.pip_name
#   resource_group_name = each.value.rg_name
#   location            = each.value.location
#   allocation_method   = each.value.allocation_method

#   tags = merge(each.value.tags, { environment = each.value.environment })
#   }


# data "azurerm_public_ip" "example" {
#   name                = "name_of_public_ip"
#   resource_group_name = "name_of_resource_group"
# }
resource "azurerm_public_ip" "pip1" {

  for_each = var.pip_child

  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.public_ip_allocation_method

}