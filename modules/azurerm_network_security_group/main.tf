resource "azurerm_network_security_group" "tatansg" {

  for_each = var.nsgs

  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {

    name                       = "allow-ssh"
    priority                   = 100

    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"

    source_port_range          = "*"
    destination_port_range     = "22"

    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}