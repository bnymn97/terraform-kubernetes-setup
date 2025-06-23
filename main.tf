resource "hcloud_server" "k8s_master" {
  name        = "k8s-master"
  server_type = "cax11"
  image       = "ubuntu-24.04"
  datacenter  = "nbg1-dc3"
  ssh_keys    = ["ssh-key"]
  user_data   = templatefile("cloud-init-master.yaml", {
    velero_access_key = var.hcloud_access_key,
    velero_secret_key = var.hcloud_secret_key
  })

  firewall_ids = [hcloud_firewall.k8s_firewall.id]

  network {
    network_id = hcloud_network.private_network.id
    ip         = "10.0.0.2"
  }
}

resource "hcloud_server" "worker" {
  count       = 2
  name        = "k8s-worker-${count.index + 1}"
  server_type = "cax11"
  image       = "ubuntu-24.04"
  datacenter  = "nbg1-dc3"
  ssh_keys    = ["ssh-key"]
  user_data   = file("cloud-init-worker.yaml")
  labels      = { role = "ingress" }

  firewall_ids = [hcloud_firewall.k8s_firewall.id]

  network {
    network_id = hcloud_network.private_network.id
    ip         = "10.0.0.${count.index + 3}"
  }
}
