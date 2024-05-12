output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "azurerm_network_security_group" {
  value = azurerm_network_security_group.nsg.name
}

output "azurerm_network_security_rule" {
  value = azurerm_network_security_rule.nsg_rule.name
}

output "azurerm_virtual_network" {
  value = azurerm_virtual_network.vn.name
}

output "azurerm_subnet" {
  value = azurerm_subnet.subnets.name
}

output "azurerm_public_ip" {
  value = azurerm_public_ip.public_ip.name
}

output "azurerm_network_interface" {
  value = azurerm_network_interface.network_interface.name
}

output "azurerm_linux_virtual_machine" {
  value = {
    linux_vm_name  = azurerm_linux_virtual_machine.linux_vm.name
    public_ip      = "${azurerm_linux_virtual_machine.linux_vm.name}: ${data.azurerm_public_ip.data_ip.ip_address}"
  }
}
