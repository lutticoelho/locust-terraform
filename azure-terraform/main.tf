resource "azurerm_resource_group" "rg" {
  name     = "locust"
  location = var.resource_group_location
}

resource "azurerm_container_group" "lucust-master-container-group" {
  name                = "locust-master"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "public"
  dns_name_label      = "${var.dns_suffix}-master"
  os_type             = "Linux"

  container {
    name   = "locust-master"
    image  = var.locust_image_name
    cpu    = "1"
    memory = "2"
    environment_variables = {
      "LOCUST_LOCUSTFILE" : var.locust_file,
      "LOCUST_HOST" : var.locust_host_under_test,
      "LOCUST_USERS" : 10,
      "LOCUST_SPAWN_RATE" : 5,
      "LOCUST_MODE_MASTER" : true
    }

    ports {
      port     = 8089
      protocol = "TCP"
    }

    ports {
      port     = 5557
      protocol = "TCP"
    }
  }

  container {
    name   = "locust-local-worker"
    image  = var.locust_image_name
    cpu    = "1"
    memory = "2"
    environment_variables = {
      "LOCUST_LOCUSTFILE" : var.locust_file,
      "LOCUST_MODE_WORKER" : true,
    }
  }

  tags = {
    environment = "testing"
  }
}

resource "azurerm_container_group" "lucust-worker-container-group" {
  for_each            = toset(var.locust_workers_locations)
  name                = "locust-worker-${each.key}"
  location            = "${each.key}"
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "public"
  dns_name_label      = "${var.dns_suffix}-worker-${each.key}"
  os_type             = "Linux"
  depends_on = [
    azurerm_container_group.lucust-master-container-group
  ]

  container {
    name   = "locust-worker-${each.key}00"
    image  = var.locust_image_name
    cpu    = "1"
    memory = "2"
    environment_variables = {
      "LOCUST_LOCUSTFILE" : var.locust_file,
      "LOCUST_MODE_WORKER" : true,
      "LOCUST_MASTER_NODE_HOST": "${azurerm_container_group.lucust-master-container-group.ip_address}"
    }
    ports {
      port     = 8089
      protocol = "TCP"
    }

    ports {
      port     = 5557
      protocol = "TCP"
    }
  }

  container {
    name   = "locust-worker-${each.key}01"
    image  = var.locust_image_name
    cpu    = "1"
    memory = "2"
    environment_variables = {
      "LOCUST_LOCUSTFILE" : var.locust_file,
      "LOCUST_MODE_WORKER" : true,
      "LOCUST_MASTER_NODE_HOST": "${var.dns_suffix}-master.${azurerm_resource_group.rg.location}.azurecontainer.io"
    }
  }

  tags = {
    environment = "testing"
  }
}
