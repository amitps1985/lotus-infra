rgs = {
  rg1 = {
  name = "tappu-rg"
  location = "australiacentral"
  managed_by = "tata-group"
  tags = {
    env = "dev"
    project = "lotus-infra"
  }
  }
}
stgs = {
    stg1 = {
  name = "stgtataaccount0101"
  location = "australiacentral"
  resource_group_name = "tappu-rg"
  account_tier = "Standard"
  account_replication_type = "LRS"
    }
}
pips = {
pip1 = {
    pip_name            = "tappu-frontend-pip"
    location            = "australiacentral"
    resource_group_name = "tappu-rg"
    allocation_method   = "Static"
  }

  # pip2 = {
  #   pip_name            = "tappu-backend-pip"
  #   location            = "australiacentral"
  #   resource_group_name = "tappu-rg"
  #   allocation_method   = "Static"
  # }
  pip3 = {
    pip_name            = "tappu-bastion-pip"
    location            = "australiacentral"
    resource_group_name = "tappu-rg"
    allocation_method   = "Static"
  }
}

vnets = {
  v1 = {
    vnet_name           = "tappu-vnet"
    location            = "australiacentral"
    resource_group_name = "tappu-rg"
    address_space = ["10.0.0.0/16"]
  }

  # v2 = {
  #   name                = "pappu-vnet"
  #   location            = "australiacentral"
  #   resource_group_name = "tappu-rg"

  #   address_space = [
  #     "10.1.0.0/16"
  #   ]
  # }
}

subnets = {
subnet1 = {

    subnet_name          = "tappu-frontend-subnet"
    resource_group_name  = "tappu-rg"
    vnet_name            = "tappu-vnet"
    nsg_name             = "tappu-frontend-nsg"
    address_prefixes = ["10.0.1.0/24"]
  }

  # subnet2 = {
  #   subnet_name                 = "tappu-backend-subnet"
  #   resource_group_name  = "tappu-rg"
  #   vnet_name            = "tappu-vnet"
  #   nsg_name             = "tappu-backend-nsg"
  #   address_prefixes = [
  #     "10.0.2.0/24"
  #   ]
  # }
  subnet3 = {

    subnet_name          = "AzureBastionSubnet"
    resource_group_name  = "tappu-rg"
    vnet_name            = "tappu-vnet"
    address_prefixes = ["10.0.10.0/26"]
    nsg_name            = "tappu-bastion-nsg"
  }
}

nsgs = {
  nsg1 = {
    nsg_name            = "tappu-frontend-nsg"
    location            = "australiacentral"
    resource_group_name = "tappu-rg"
  }

  # nsg2 = {
  #   nsg_name            = "tappu-backend-nsg"
  #   location            = "australiacentral"
  #   resource_group_name = "tappu-rg"
  # }
   nsg2 = {
    nsg_name            = "tappu-bastion-nsg"
    location            = "australiacentral"
    resource_group_name = "tappu-rg"
  }
}

vms = {
  vm1 = {
    vm_name                = "tappu-frontend-vm"
    location               = "australiacentral"
    resource_group_name    = "tappu-rg"
    size                = "Standard_B2as_v2"
    nsg_name               = "tappu-frontend-nsg"
    storage_account_type   = "Standard_LRS"
    caching                = "ReadWrite"
    publisher              = "Canonical"
    offer                  = "0001-com-ubuntu-server-jammy"
    sku                    = "22_04-lts"
    version                = "latest"
    nic_name               = "tappu-frontend-nic"
    pip_name               = "tappu-frontend-pip"

    ip_config_name         = "frontend-ip-config"
    vnet_name              = "tappu-vnet"
    subnet_name            = "tappu-frontend-subnet"
  }

  # vm2 = {
  #   vm_name                = "tappu-backend-vm"
  #   location               = "australiacentral"
  #   resource_group_name    = "tappu-rg"
  #   size                = "Standard_B2as_v2"
  #   nsg_name               = "tappu-backend-nsg"
  #   storage_account_type   = "Standard_LRS"
  #   caching                = "ReadWrite"
  #   publisher              = "Canonical"
  #   offer                  = "0001-com-ubuntu-server-jammy"
  #   sku                    = "22_04-lts"
  #   version                = "latest"
  #   nic_name               = "tappu-backend-nic"
  #   pip_name               = "tappu-backend-pip"
  #   ip_config_name         = "backend-ip-config"
  #   vnet_name              = "tappu-vnet"
  #   subnet_name            = "tappu-backend-subnet"
  # }
}
bastions = {
  bastions1 = {
    bastion_name        = "tappu-bastion"
    location            = "australiacentral"
    resource_group_name = "tappu-rg"
    vnet_name           = "tappu-vnet"
    subnet_name         = "AzureBastionSubnet"
    pip_name            = "tappu-bastion-pip"
    ip_config_name      = "bastion-ip-config"
    nsg_name            = "tappu-bastion-nsg"
  }
}
  