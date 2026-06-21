module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs = var.rgs
}
module "storage_account" {
  source = "../../modules/azurerm_stroage_account"
  stgs = var.stgs
  depends_on = [ module.resource_group ]
}
module "virtual_network" {
  source = "../../modules/azurerm_virtual_network"
vnets = var.vnets
depends_on = [ module.resource_group ]
}
module "subnets" {
  source = "../../modules/azurerm_subnet"
  subnets = var.subnets
  depends_on = [ module.virtual_network, module.network_security ]
}
module "network_security" {
  source = "../../modules/azurerm_network_security_group"
  nsgs = var.nsgs
  depends_on = [ module.resource_group ]
}
module "public_ip" {
  source = "../../modules/azurerm_public_ip"
  pips = var.pips
}
module "virtual_machine" {
  source = "../../modules/azurerm_linux_virtual_machime"
  vms = var.vms
  depends_on = [ module.public_ip, module.subnets ]
}
module "bastion" {
  source = "../../modules/azurerm_bastion"
  bastions = var.bastions
  depends_on = [ module.subnets, module.public_ip ]
}