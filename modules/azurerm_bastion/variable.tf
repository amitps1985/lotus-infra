variable "bastions" {
  type = map(object({
    bastion_name       = string
    location           = string
    resource_group_name = string
    vnet_name          = string
    subnet_name        = string
    pip_name           = string
    ip_config_name     = string
    nsg_name = string
  }))
}