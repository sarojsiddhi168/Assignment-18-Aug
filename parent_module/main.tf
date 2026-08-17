module "rg_parent" {
  source   = "../child_module/1rg"
  rg_child = var.rg_parent
}

module "vnet_parent" {
  depends_on = [module.rg_parent]
  source     = "../child_module/2vnet"
  vnet_child = var.vnet_parent
}

module "subnet_parent" {
  depends_on   = [module.vnet_parent]
  source       = "../child_module/3subnet"
  subnet_child = var.subnet_parent
}

module "nsg_parent" {
  depends_on = [module.rg_parent]
  source     = "../child_module/4nsg"
  nsg_child  = var.nsg_parent
}

module "pip_parent" {
  depends_on = [module.rg_parent]
  source     = "../child_module/5pip"
  pip_child  = var.pip_parent
}


module "nic_parent" {
  depends_on = [module.subnet_parent, module.pip_parent]

  source = "../child_module/6nic"

  nic_child    = var.nic_parent
  subnet_child = var.subnet_parent
}



module "vm_parent" {
  depends_on = [module.nic_parent]

  source = "../child_module/7vm"

  vm_child   = var.vm_parent
  nic_parent = module.nic_parent.nic_ids
}

module "stg_Parent" {
  depends_on = [module.rg_parent]
  source = "../child_module/8storage_account"
  stg_child = var.stg_parent
}