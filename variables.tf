variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "security_group_name_prefix" {
  type        = string
  default     = "nsg"
  description = "Prefix of the network security group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "security_group_rule_prefix" {
  type        = string
  default     = "rule"
  description = "Prefix of the network security group rule that's combined with a random ID so name is unique in your Azure subscription."
}

variable "virtual_network_name_prefix" {
  type        = string
  default     = "vn"
  description = "Prefix of the virtual network name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "subnet_name_prefix" {
  type        = string
  default     = "subnet"
  description = "Prefix of the subnet name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "public_ip_prefix" {
  type        = string
  default     = "public_ip"
  description = "Prefix of the public IP that's combined with a random ID so name is unique in your Azure subscription."
}

variable "network_interface_prefix" {
  type        = string
  default     = "ntwrk_inteface"
  description = "Prefix of the network interface that's combined with a random ID so name is unique in your Azure subscription."
}

variable "ip_configuration_prefix" {
  type        = string
  default     = "internal"
  description = "Prefix of the ip configuration that's combined with a random ID so name is unique in your Azure subscription."
}

variable "linux_vm_prefix" {
  type        = string
  default     = "linux-vm-in"
  description = "Prefix of the linux virtual machine that's combined with a random ID so name is unique in your Azure subscription."
}

variable "source_address" {
  type        = string
  description = "My public IP. Should be in tfvars file."
}

variable "host_os" {
  type        = string
  #default     = "linux"
  description = "Host OS. Was also written in tfvars file."
}