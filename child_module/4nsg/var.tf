# variable "nsg_child" {
#     type = map(object({
#         nsg_name = string
#         rg_name = string
#         location = string
#         priority = number
#         direction = string
#         access = string
#         protocol = string
#         source_port_range = string
#         destination_port_range = string
#         source_address_prefix = string
#         destination_address_prefix = string
#     }))
  
# }
variable "nsg_child" {
  type = map(object({
    nsg_name = string
    rg_name  = string
    location = string

    sec_rules = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}