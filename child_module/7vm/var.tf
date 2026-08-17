variable "vm_child" {
  type = map(object({
    vm_name          = string
    rg_name          = string
    location         = string
    vm_size          = string
    admin_username   = string
    admin_password   = string
    nic_name         = string
    publisher        = optional(string, "Canonical")
    offer            = optional(string, "0001-com-ubuntu-server-jammy")
    sku              = optional(string, "22_04-lts")
    version          = optional(string, "latest")
    caching          = optional(string, "ReadWrite")
    create_option    = optional(string, "FromImage")
    managed_disk_type = optional(string, "Standard_LRS")
  }))
}
variable "nic_parent" {
  type = any
}