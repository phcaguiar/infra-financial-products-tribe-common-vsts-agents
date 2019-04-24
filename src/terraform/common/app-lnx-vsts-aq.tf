resource "azurerm_network_interface" "nic-app-lnx-vsts-aq" {
  name                = "${var.nic_app_lnx_vsts_aq_name}"
  location            = "${var.location}"
  resource_group_name = "${var.product_rg_name}"

  ip_configuration {
    name                          = "${var.nic_ip_conf_app_lnx_vsts_aq_name}"
    subnet_id                     = "${data.azurerm_subnet.internal_subnet.id}"
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_virtual_machine" "vm-app-lnx-vsts-aq" {
  name                  = "${var.vm_app_lnx_vsts_aq_name}"
  location              = "${var.location}"
  resource_group_name   = "${var.product_rg_name}"
  network_interface_ids = ["${azurerm_network_interface.nic-app-lnx-vsts-aq.id}"]
  vm_size               = "${var.vm_app_lnx_vsts_aq_size}"

  delete_os_disk_on_termination = true

  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "${var.vm_storage_image_reference_app_lnx_vsts_aq_publisher}"
    offer     = "${var.vm_storage_image_reference_app_lnx_vsts_aq_offer}"
    sku       = "${var.vm_storage_image_reference_app_lnx_vsts_aq_sku}"
    version   = "${var.vm_storage_image_reference_version_app_lnx_vsts_aq}"
  }

  storage_os_disk {
    name              = "${var.vm_storage_os_disk_app_lnx_vsts_aq_name}"
    caching           = "${var.vm_storage_os_disk_app_lnx_vsts_aq_caching}"
    create_option     = "${var.vm_storage_os_app_lnx_vsts_aq_create_option}"
    managed_disk_type = "${var.vm_storage_os_managed_disk_app_lnx_vsts_aq_type}"
    disk_size_gb      = "${var.vm_storage_os_disk_app_lnx_vsts_aq_disk_size_gb}"
  }

  os_profile {
    computer_name  = "${var.vm_os_profile_computer_app_lnx_vsts_aq_name}"
    admin_username = "${var.vm_os_profile_admin_username}"
    admin_password = "${var.vm_os_profile_admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  
}