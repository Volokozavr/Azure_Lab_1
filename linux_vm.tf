resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = "${var.linux_vm_prefix}-${random_pet.rg_name.id}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]

  custom_data = filebase64("customdata.tpl")

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-script.tpl", {
        hostname        = self.public_ip_address,
        user            = "adminuser",
        identityfile    = "~/.ssh/id_rsa"
    })
    interpreter = var.host_os == "linux" ? ["bash", "-c"] : ["Powershell", "-Command"]
  }

  tags = {
    environment = "test"
    owner       = "yu"
  }
}

