variable "rg_n" {
    type = map(object({
        name = string
        location = string 
    }))
}
variable "vnet_n" {
    type = map(object({
        name = string
        location = string
        rg_name = string
        address_space = list(string)
    }))
}

variable "subnet_n" {
    type = map(object({
        subnet_name = string
        rg_name = string
        vnet_name = string
        address_prefixes = list(string)
    }))
}

variable "IP_n" {
    type = map(object({
        IP_name = string
        rg_name = string
        IP_location = string
        allocation_method = string
        sku = string
    }))
}

variable "nic_n" {
    type = map(object({
    name                = string
    location            = string
    rg_name = string
    subnet_name         = string
    public_ip_name      = string
    ip_configuration    = list(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}

variable "vm_n" {
    type = map(object({
        vm_name = string
        vm_location = string
        rg_name = string
        vm_size = string
        admin_username = string
        admin_password = string
        disable_password = bool
        network_interface_name = string

        os_disk = map(object({
            name = string
            disk_size_gb = number
            os_caching = string
            storage_account_type = string
        }))

        source_image_reference = map(object({
      image_publisher = string
      image_offer     = string
      image_sku       = string   
      image_version   = string
     }))
    }))
}

    variable "sql_server_n" {
        type = map(object({
            sql_name = string
            rg_name = string
            location = string
            sql_version = string
            administrator_login = string
            administrator_password = string
        }))
    }

variable "db_name" {
    type = map(object({
        db_name = string
        collation = string
        license_type = string
        size_gb = string
        sku_name = string
    }))
}