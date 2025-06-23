resource "hcloud_firewall" "k8s_firewall" {
  name = "k8s-firewall"

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    source_ips  = ["0.0.0.0/0"]
    description = "SSH"
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "6443"
    source_ips  = ["0.0.0.0/0"]
    description = "Kubernetes API Server"
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "80"
    source_ips  = ["0.0.0.0/0"]
    description = "HTTP Ingress"
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "443"
    source_ips  = ["0.0.0.0/0"]
    description = "HTTPS Ingress"
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "30000-32767"
    source_ips  = ["0.0.0.0/0"]
    description = "NodePorts"
  }

  rule {
    direction        = "out"
    protocol         = "tcp"
    port             = "1-65535"
    destination_ips  = ["0.0.0.0/0"]
    description      = "Outbound TCP"
  }

  rule {
    direction        = "out"
    protocol         = "udp"
    port             = "1-65535"
    destination_ips  = ["0.0.0.0/0"]
    description      = "Outbound UDP"
  }
}
