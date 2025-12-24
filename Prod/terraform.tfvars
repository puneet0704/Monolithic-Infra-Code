rg_n = {
  "rg1" = {
    name     = "rg_prod_puneet"
    location = "centralindia"
  }
}


vnet_n = {
  "vnet1" = {
    name          = "vnet_puneet"
    location      = "centralindia"
    rg_name       = "rg_prod_puneet"
    address_space = ["10.0.0.0/16"]
  }
}

subnet_n = {
  "subnet1" = {
    subnet_name      = "front_subnet"
    rg_name          = "rg_prod_puneet"
    vnet_name        = "vnet_puneet"
    address_prefixes = ["10.0.1.0/24"]
  }

  "subnet2" = {
    subnet_name      = "back_subnet"
    rg_name          = "rg_prod_puneet"
    vnet_name        = "vnet_puneet"
    address_prefixes = ["10.0.2.0/24"]
  }
}

IP_n = {
  "IP1" = {
    IP_name           = "front_pip"
    rg_name           = "rg_prod_puneet"
    IP_location       = "centralindia"
    allocation_method = "Static"
    sku               = "Standard"
  }
  "IP2" = {
    IP_name           = "back_pip"
    rg_name           = "rg_prod_puneet"
    IP_location       = "centralindia"
    allocation_method = "Static"
    sku               = "Standard"
  }
}

nic_n = {
  "front_nic" = {
    name                = "front_nic"
    location            = "centralindia"
    rg_name = "rg_prod_puneet"
    subnet_name         = "front_subnet"
    public_ip_name      = "front_pip"
    ip_configuration    = [
      {
        name                          = "front_ipconfig"
        private_ip_address_allocation = "Dynamic"
      }
    ]
  }

  "back_nic" = {
    name                = "back_nic"
    location            = "centralindia"
    rg_name = "rg_prod_puneet"
    subnet_name         = "back_subnet"
    public_ip_name      = "back_pip"
    ip_configuration    = [
      {
        name                          = "back_ipconfig"
        private_ip_address_allocation = "Dynamic"
      }
    ]
  }
}

vm_n = {
  "vm1" = {
    vm_name          = "front-vm-puneet"
    rg_name          = "rg_prod_puneet"
    vm_location      = "centralindia"
    vm_size          = "Standard_D2s_v3"
    admin_username   = "login"
    admin_password   = "password"
    disable_password = false
    network_interface_name = "front_nic"

    os_disk = {
      "os_disk_1" = {
      name = "osdisk_puneet_prod1"
      disk_size_gb = 30
      os_caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
      }
    }

    source_image_reference = {
    "image_ref_1" = {
      image_publisher   = "Canonical"
      image_offer      = "0001-com-ubuntu-server-jammy"
      image_sku        = "22_04-LTS"
      image_version    = "latest"
    }
    }
  }

"vm2" = {
    vm_name          = "back-vm-puneet"
    rg_name          = "rg_prod_puneet"
    vm_location      = "centralindia"
    vm_size          = "Standard_D2s_v3"
    admin_username   = "login"
    admin_password   = "password"
    disable_password = false
    network_interface_name = "back_nic"

    os_disk = {
      "os1" = {
      name = "osdisk_puneet_prod2"
      disk_size_gb = 30
      os_caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
      }
    }

    source_image_reference = {

    "image1" = {
      image_publisher   = "Canonical"
      image_offer      = "0001-com-ubuntu-server-jammy"
      image_sku        = "22_04-LTS"
      image_version    = "latest"
    }
    }
  }
}


sql_server_n ={
    "sql_server" = {
        sql_name = "sql-server-puneet"
        rg_name = "rg_prod_puneet"
        location = "centralindia"
        sql_version = "12.0"
        administrator_login = "sql_login"
        administrator_password = "sql_password"
    }
}

db_name = {
    "db1" = {
        db_name = "db-puneet"
        collation = "SQL_Latin1_General_CP1_CI_AS"
        license_type = "LicenseIncluded"
        size_gb = "10"
        sku_name = "GP_Gen5_2"
    }
}
