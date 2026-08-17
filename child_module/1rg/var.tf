variable "rg_child" {
    type = map(object({
        rg_name = string
        location            = string
    }))

}
  
