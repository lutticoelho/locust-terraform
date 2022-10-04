variable "resource_group_location" {
  default = "eastus"
  description   = "Location of the resource group."
}

variable "resource_group_name" {
  default = "locust-experiment"
}

variable "locust_workers_locations" {
  #default = ["eastus2", "brazilsouth", "westeurope", "australiasoutheast", "eastus"]
  default = ["eastus2"]
}

variable "locust_image_name" {
  default = "lutticoelho/locustsample:0.5"
  type = string
}

variable "locust_host_under_test" {
  default = "https://liderancaegestao.online"
  type = string
}

variable "locust_file" {
  default = "/home/locust/locust.py"
  type = string
}

variable "dns_suffix" {
    default = "locust-exemple"
}