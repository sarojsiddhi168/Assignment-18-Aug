# resource "azurerm_network_security_group" "nsg1" {

#     for_each = var.nsg_child
#   name                = each.value.nsg_name
#   location            = each.value.location
#   resource_group_name = each.value.rg_name

#   security_rule {
#     name                       = each.value.nsg_name
#     priority                   = each.value.priority
#     direction                  = each.value.direction
#     access                     = each.value.access
#     protocol                   = each.value.protocol
#     source_port_range          = each.value.source_port_range
#     destination_port_range     = each.value.destination_port_range
#     source_address_prefix      = each.value.source_address_prefix
#     destination_address_prefix = each.value.destination_address_prefix
  
#   }
# }
resource "azurerm_network_security_group" "nsg" {

  for_each = var.nsg_child

  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  dynamic "security_rule" {

    for_each = each.value.sec_rules

    content {

      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix

    }
  }

}