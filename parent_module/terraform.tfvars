rg_parent = {
  rg1 = {
    rg_name  = "saroj_rg"
    location = "eastus"
  }
  rg2 = {
    rg_name  = "manoj_rg"
    
    location = "eastus"
  }
    rg3 = {
    rg_name  = "siddhu_rg"
    
    location = "eastus"
}}
# vnet_parent is a map variable that contains the configuration for the virtual network in the parent module. It includes the name of the virtual network, its location, and the name of the resource group it belongs to.

vnet_parent = {
  vnet1 = {
    vnet_name     = "saroj_vnet"
    location      = "eastus"
    rg_name       = "saroj_rg"
    address_space = ["10.0.0.0/16"]
  }
   vnet2 = {
    vnet_name     = "manoj_vnet"
    location      = "eastus"
    rg_name       = "saroj_rg"
    address_space = ["10.0.0.1/16"]
    }
}
subnet_parent = {
  subnet1 = {
    subnet_name     = "saroj_subnet"
    rg_name         = "saroj_rg"
    vnet_name       = "saroj_vnet"
    subnet_prefixes = ["10.0.1.0/24"]
  }
}

nsg_parent = {
  nsg1 = {
    nsg_name = "saroj_nsg"
    location = "eastus"
    rg_name  = "saroj_rg"
    sec_rules = {
      rule1 = {
        name                       = "AllowSSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      rule2 = {
        name                       = "AllowHTTP"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

pip_parent = {
  pip1 = {
    pip_name                    = "saroj_pip"
    location                    = "eastus"
    rg_name                     = "saroj_rg"
    public_ip_allocation_method = "Static"
  }
}

nic_parent = {
  nic1 = {
    nic_name  = "saroj_nic"
    location  = "eastus"
    rg_name   = "saroj_rg"
    subnet_id = "subnet1"
    vnet_name = "saroj_vnet"
    pip_id    = "pip1"
    pip_name  = "saroj_pip"
    nsg_id    = "nsg1"
    ip_configurations = {
      ipconfig1 = {
        name                          = "ipconfig1"
        pip_id                        = "pip1"
        subnet_id                     = "subnet1"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}

vm_parent = {
  vm1 = {
    vm_name        = "saroj_vm"
    location       = "eastus"
    rg_name        = "saroj_rg"
    vm_size        = "Standard_B1s"
    admin_username = "sarojadmin"
    admin_password = "Saroj@123"
     nic_name = "nic1"

  }
}

stg_parent = {
  stg1 = {
    stg_name                 = "sarojstg"
    rg_name                  = "saroj_rg"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}