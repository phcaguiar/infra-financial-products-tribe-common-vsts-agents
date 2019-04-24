# Service Variables
variable "nic_inf_wds_vsts_aq_name" {
  description = "Set a name for your nic."
}

variable "nic_ip_conf_inf_wds_vsts_aq_name" {
  description = "Set a name for your IC IP configuration."
}

# Virtual machine variables
variable "vm_inf_wds_vsts_aq_name" {
  description = "Set a name for your virtual machine."
}

variable "vm_inf_wds_vsts_aq_size" {
  description = "Set a vm size for your virtual machine."
}


# Virtual machine storage variables
variable "vm_storage_os_disk_inf_wds_vsts_aq_name" {
  description = "Set a name for your storage disk name."
}

variable "vm_storage_os_disk_inf_wds_vsts_aq_caching" {
  description = "Set a storage disk caching for your virtual machine. If you do not fill in the default value will be used below."
  default     = "ReadWrite"
}

variable "vm_storage_os_inf_wds_vsts_aq_create_option" {
  description = "Set a storage create option for your virtual machine. If you do not fill in the default value will be used below."
  default     = "FromImage"
}

variable "vm_storage_os_managed_disk_inf_wds_vsts_aq_type" {
  description = "Set a storage managed disk type for your virtual machine. If you do not fill in the default value will be used below."
  default     = "Standard_LRS"
}

# variable "vm_storage_os_disk_inf_wds_vsts_aq_disk_size_gb" {
#   description = "Set a storage disk size."
# }


# Virtual machine credential and profile variables
variable "vm_os_profile_computer_inf_wds_vsts_aq_name" {
  description = "Set a hostname for your virtual machine."
}


# Virtual machine image variables
variable "vm_storage_image_reference_inf_wds_vsts_aq_publisher" {
  description = "Set a storage image reference publisher for your virtual machine."
}

variable "vm_storage_image_reference_inf_wds_vsts_aq_offer" {
  description = "Set a storage image reference offer for your virtual machine."
}

variable "vm_storage_image_reference_inf_wds_vsts_aq_sku" {
  description = "Set a storage image reference sku for your virtual machine."
}

variable "vm_storage_image_reference_version_inf_wds_vsts_aq" {
  description = "Set a storage image reference version for your virtual machine."
}
