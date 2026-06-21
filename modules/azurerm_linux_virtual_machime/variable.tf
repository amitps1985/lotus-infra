variable "vms" {
  type = map(object({
    vm_name = string
    location = string
    resource_group_name = string
    size = string
    nsg_name = string
    storage_account_type = string
    caching = string
    publisher = string
    offer = string
    sku = string
    version = string
    nic_name = string
    ip_config_name = string
    vnet_name = string
    subnet_name = string
    pip_name = string
  }))
}