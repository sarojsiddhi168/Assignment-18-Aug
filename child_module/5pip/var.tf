variable "pip_child" {
    type = map(object({
        pip_name = string
        rg_name = string
        location = string
        public_ip_allocation_method = string
    }))
  
}