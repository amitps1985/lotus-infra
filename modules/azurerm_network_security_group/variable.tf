variable "nsgs" {
  type = map(object({
    nsg_name = string
    location = string
    resource_group_name = string
  }))
}