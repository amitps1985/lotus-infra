resource "azurerm_network_interface" "nic" {
  for_each = var.vms
  name = each.value.nic_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name

ip_configuration {
name = each.value.ip_config_name
subnet_id = data.azurerm_subnet.subnet[each.key].id
private_ip_address_allocation = "Dynamic"
public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
}
}
resource "azurerm_linux_virtual_machine" "tatavm" {
  for_each = var.vms
  name = each.value.vm_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  size = each.value.size

  admin_username = "tatagroup"
  admin_password = "tata@1234"

  network_interface_ids = [
  azurerm_network_interface.nic[each.key].id]
  disable_password_authentication = false

  os_disk {
    storage_account_type = each.value.storage_account_type
    caching = each.value.caching
  }
  source_image_reference {
    publisher = each.value.publisher
    offer = each.value.offer
    sku = each.value.sku
    version = each.value.version

  }
}