# Commom variables
variable "location" {
  description = "Set a location for your new resource."
}

variable "subscription_id" {
  description = "The subscription ID"
}

variable "network_rg_name" {
  description = "The shared resource group in your subscription used to allocate the virtual network, subnet, aks."
}

variable "shared_vnet_name" {
  description = "The name of the virtual network where you will create your new resource."
}

variable "shared_internal_subnet_name" {
  description = "The name of the internal subnet where you will create your new resource."
}

variable "product_rg_name" {
  description = "The resource group of your product where the new features will be created."
}

variable "vm_storage_os_disk_caching" {
  description = "Set a storage disk caching for your virtual machine. If you do not fill in the default value will be used below."
  default     = "ReadWrite"
}

variable "vm_storage_os_create_option" {
  description = "Set a storage create option for your virtual machine. If you do not fill in the default value will be used below."
  default     = "FromImage"
}

variable "vm_storage_os_managed_disk_type" {
  description = "Set a storage managed disk type for your virtual machine. If you do not fill in the default value will be used below."
  default     = "Standard_LRS"
}


variable "vm_os_profile_admin_username" {
  description = "Set a admin username for your virtual machine. Use environment variable to set this value."
}

variable "vm_os_profile_admin_password" {
  description = "Set a admin password for your admin username. Use environment variable to set this value."
}