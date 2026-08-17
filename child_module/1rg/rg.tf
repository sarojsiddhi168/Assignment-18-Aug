
resource "azurerm_resource_group" "rg1" {
  for_each = var.rg_child

  name     = each.value.rg_name
  location = each.value.location
}