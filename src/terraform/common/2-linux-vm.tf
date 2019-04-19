resource "azurerm_network_interface" "niclinux" {
  name                = "${var.nic_name}linux"
  location            = "${var.location}"
  resource_group_name = "${var.product_rg_name}"

  ip_configuration {
    name                          = "${var.nic_ip_configuration_name}linux"
    subnet_id                     = "${data.azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.pubiplinux.id}"
  }
}

resource "azurerm_virtual_machine" "vmlinux" {
  name                  = "${var.vm_name}linux"
  location              = "${var.location}"
  resource_group_name   = "${var.product_rg_name}"
  network_interface_ids = ["${azurerm_network_interface.niclinux.id}"]
  vm_size               = "${var.vm_size}"

  delete_os_disk_on_termination = true

  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "${var.vm_storage_image_reference_publisher}"
    offer     = "${var.vm_storage_image_reference_offer}"
    sku       = "${var.vm_storage_image_reference_sku}"
    version   = "${var.vm_storage_image_reference_version}"
  }

  storage_os_disk {
    name              = "${var.vm_storage_os_disk_name}linux"
    caching           = "${var.vm_storage_os_disk_caching}"
    create_option     = "${var.vm_storage_os_create_option}"
    managed_disk_type = "${var.vm_storage_os_managed_disk_type}"
  }

  storage_data_disk {
    name          = "${var.vm_storage_os_disk_name}-data"
    disk_size_gb  = "20"
    create_option = "Empty"
    lun           = 0
  }   

  os_profile {
    computer_name  = "${var.vm_os_profile_computer_name}linux"
    admin_username = "${var.vm_os_profile_admin_username}"
    admin_password = "${var.vm_os_profile_admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  
}