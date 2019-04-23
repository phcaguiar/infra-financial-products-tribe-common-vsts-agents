data "azurerm_subnet" "internal_subnet" {
  name                 = "${var.shared_internal_subnet_name}"
  virtual_network_name = "${var.shared_vnet_name}"
  resource_group_name  = "${var.network_rg_name}"
}