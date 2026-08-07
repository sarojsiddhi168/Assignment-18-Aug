variable "nic_child" {
  type = map(object({
    nic_name = string
    rg_name  = string
    location = string
    subnet_id = string
    vnet_name = string
    pip_id = string
    pip_name = string
    nsg_id = string
    ip_configurations = map(object({
      name                          = string
      pip_id                        = string
      subnet_id                     = string
      private_ip_address_allocation = string
    }))
  }))
}

variable "subnet_child" {
  type = map(object({
    subnet_name     = string
    rg_name         = string
    vnet_name       = string
    subnet_prefixes = list(string)
  }))
}
