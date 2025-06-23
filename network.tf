resource "hcloud_network" "private_network" {
  name     = "k8s-network"
  ip_range = "10.0.0.0/24"
}

resource "hcloud_network_subnet" "k8s_subnet" {
  network_id   = hcloud_network.private_network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.0.0/24"
}
