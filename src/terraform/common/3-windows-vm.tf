# locals {
#   custom_data_params  = "Param($ComputerName = \"${var.vm_name}windows\")"
#   custom_data_content = "${local.custom_data_params} ${file("./files/winrm.ps1")}"
# }

# resource "azurerm_network_interface" "nicwindows" {
#   name                = "${var.nic_name}windows"
#   location            = "${var.location}"
#   resource_group_name = "${var.product_rg_name}"

#   ip_configuration {
#     name                          = "${var.nic_ip_configuration_name}windows"
#     subnet_id                     = "${data.azurerm_subnet.subnet.id}"
#     private_ip_address_allocation = "dynamic"
#     public_ip_address_id          = "${azurerm_public_ip.pubipwindows.id}"
#   }
# }

# resource "azurerm_virtual_machine" "vmwindows" {
#   name                  = "${var.vm_name}windows"
#   location              = "${var.location}"
#   resource_group_name   = "${var.product_rg_name}"
#   network_interface_ids = ["${azurerm_network_interface.nicwindows.id}"]
#   vm_size               = "${var.vm_size}"

#   delete_os_disk_on_termination = true

#   delete_data_disks_on_termination = true

#   storage_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2016-Datacenter-Server-Core"
#     version   = "latest"
#   }

#   storage_os_disk {
#     name              = "${var.vm_storage_os_disk_name}windows"
#     caching           = "${var.vm_storage_os_disk_caching}"
#     create_option     = "${var.vm_storage_os_create_option}"
#     managed_disk_type = "${var.vm_storage_os_managed_disk_type}"
#   }

#   os_profile {
#     computer_name  = "${var.vm_os_profile_computer_name}windows"
#     admin_username = "${var.vm_os_profile_admin_username}"
#     admin_password = "${var.vm_os_profile_admin_password}"
#     custom_data    = "${local.custom_data_content}"
#   }

#   os_profile_windows_config {
#     provision_vm_agent  = true
#     timezone            = "UTC"

#     additional_unattend_config {
#       pass         = "oobeSystem"
#       component    = "Microsoft-Windows-Shell-Setup"
#       setting_name = "AutoLogon"
#       content      = "<AutoLogon><Password><Value>${var.vm_os_profile_admin_password}</Value></Password><Enabled>true</Enabled><LogonCount>1</LogonCount><Username>${var.vm_os_profile_admin_username}</Username></AutoLogon>"
#     }

#     additional_unattend_config {
#       pass         = "oobeSystem"
#       component    = "Microsoft-Windows-Shell-Setup"
#       setting_name = "FirstLogonCommands"
#       content      = "${file("./files/FirstLogonCommands.xml")}"
#     }
#   }  
# }