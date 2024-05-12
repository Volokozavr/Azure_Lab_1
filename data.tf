data "azurerm_public_ip" "data_ip" {
  name                = azurerm_public_ip.public_ip.name
  resource_group_name = azurerm_resource_group.rg.name
  
}