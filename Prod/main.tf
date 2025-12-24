module "resource_group" {
    source = "../Module/resource_group"
    rg_name = var.rg_n
}

module "virtual_network" {
    depends_on = [module.resource_group]
    source = "../Module/Virtual_network"
    vnet = var.vnet_n
}

module "subnet" {
    depends_on = [module.resource_group, module.virtual_network]    
    source = "../Module/subnet"
    subnet = var.subnet_n
}

module "public_ip" {
    depends_on = [module.resource_group]
    source = "../Module/public_ip"
    IP = var.IP_n
}

module "nic_front" {
    depends_on = [module.subnet, module.public_ip]
    source = "../Module/Nic"
    nic_config = var.nic_n
}

module "virtual_machine" {
    depends_on = [module.subnet, module.public_ip, module.nic_front]
    source = "../Module/Virtual_Machine"
    vm = var.vm_n
}

module "sql_server" {
    depends_on = [module.resource_group]
    source = "../Module/sql_server"
    sql_server = var.sql_server_n
}

module "mysql_database" {
    depends_on = [module.sql_server]
    source = "../Module/mysqldatabase"
    db = var.db_name
}