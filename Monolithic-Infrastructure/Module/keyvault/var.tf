variable "kv_name" {
    type = map(object({
        kv_name = string
        kv_location = string
        rg_name = string
        disk_encryption = bool
        tenant_id = string
        delete_days = number
        protection = bool
        sku_name = string
    }))
}