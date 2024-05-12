resource "random_pet" "rg_name" {
  #   prefix = var.resource_group_name_prefix
  #   keepers = {
  #     rg_id = azurerm_resource_group.rg.id
  #   }
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = "${var.resource_group_name_prefix}-${random_pet.rg_name.id}"
  tags = {
    environment = "test"
    owner       = "yu"
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.security_group_name_prefix}-${random_pet.rg_name.id}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "test"
    owner       = "yu"
  }
}

resource "azurerm_virtual_network" "vn" {
  name                = "${var.virtual_network_name_prefix}-${random_pet.rg_name.id}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "test"
    owner       = "yu"
  }
}

resource "azurerm_subnet" "subnets" {
  name                 = "${var.subnet_name_prefix}-${random_pet.rg_name.id}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "subnet_ngs_assocoation" {
  subnet_id                 = azurerm_subnet.subnets.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.public_ip_prefix}-${random_pet.rg_name.id}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "test"
    owner       = "yu"
  }
}

resource "azurerm_network_interface" "network_interface" {
  name                = "${var.network_interface_prefix}-${random_pet.rg_name.id}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.ip_configuration_prefix}-${azurerm_public_ip.public_ip.name}"
    subnet_id                     = azurerm_subnet.subnets.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = {
    environment = "test"
    owner       = "yu"
  }
}
