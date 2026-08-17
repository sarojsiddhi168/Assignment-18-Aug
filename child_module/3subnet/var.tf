variable "subnet_child" {
    type = map(object({
        subnet_name = string
        rg_name = string
        vnet_name = string
        subnet_prefixes = list(string)
    }))
  
}