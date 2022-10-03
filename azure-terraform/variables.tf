variable "resource_group_location" {
  default = "eastus"
  description   = "Location of the resource group."
}

variable "resource_group_name" {
  default = "locust-experiment"
}

variable "locust_workers_locations" {
  default = ["eastus2", "brazilsouth", "westeurope", "australiasoutheast", "eastus"]
}

variable "locust_image_name" {
  #default = "lutticoelho/locusttest:0.2"
  type = string
}

variable "locust_host_under_test" {
  type = string
}

variable "locust_file" {
  #default = "/mnt/locust/locust.py"
  type = string
}

variable "dns_suffix" {
    default = "locust-exemple"
}