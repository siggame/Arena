# Set up input variables
variable "vm_count" {
  type = number
  description = "The number of VMs to create"
}

# Set up our project and credentials
provider "google" {
  project = "acm-game-arena-testing"
  credentials = file("../secrets/default_key.json")
}

# Create VMs
resource "google_compute_instance" "default" {
  # Make sure this name is not already in use
  name = "arena-worker-${count.index}"
  machine_type = "n1-standard-1"
  zone = "us-central1-c"

  # The number of VM instances to create
  count = var.vm_count

  tags = ["arena", "worker"]
  labels = {
    "ansible": "true"
  }

  boot_disk {
    initialize_params {
        image = "ubuntu-os-cloud/ubuntu-1804-lts"
        size = 20
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  # Enable SSH for Ansible
  metadata = {
    ssh-keys = file("../secrets/ansible.pub")
  }
}

# Output IP Addresses
output "ip_addresses" {
  value = "${google_compute_instance.default.*.network_interface.0.access_config.0.nat_ip}"
}
