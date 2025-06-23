# Kubernetes Cluster auf Hetzner Cloud mit Terraform

Dieses Projekt entstand im Rahmen meines Praktikums und demonstriert die vollständige Automatisierung eines Kubernetes-Clusters auf der Hetzner Cloud mithilfe von Terraform.  
Neben der grundlegenden Infrastruktur beinhaltet es produktionsnahe Features wie Netzwerk-Setup, Firewall-Regeln, Velero-Backups sowie die automatische Installation eines Ingress Controllers über Helm.

## 🎯 Ziel

Ziel war es, während meines Praktikums eine wiederverwendbare Infrastruktur-Vorlage zu entwickeln, mit der Kubernetes-Cluster automatisiert und sicher aufgesetzt werden können – inklusive Netzwerk, Backup und Ingress-Konfiguration.

## 🔧 Funktionen

- ☁️ Infrastruktur-Provisionierung auf [Hetzner Cloud](https://www.hetzner.com/cloud)
- 🔐 Private Netzwerke und Firewall-Regeln
- ⚙️ Kubernetes-Master- und -Worker-Nodes mit cloud-init
- 💾 Automatisierte Velero-Backups mit MinIO S3
- 🌐 Installation eines NGINX Ingress Controllers über Helm
- 🔄 CI/CD-Pipeline mit GitLab CI

## 🛠️ Eingesetzte Technologien

- [Terraform](https://www.terraform.io/)
- [Hetzner Cloud](https://www.hetzner.com/)
- [Kubernetes](https://kubernetes.io/de/)
- [MinIO](https://min.io/)
- [Velero](https://velero.io/)
- [Helm](https://helm.sh/)
- [GitLab CI/CD](https://docs.gitlab.com/ee/ci/)

## 📁 Projektstruktur

```text
.
├── provider.tf              # Provider-Konfigurationen (Hetzner, MinIO)
├── network.tf               # Netzwerk und Subnetz
├── firewall.tf              # Firewall-Regeln
├── bucket.tf                # S3-Bucket für Velero-Backups
├── main.tf                  # Master- und Worker-Node-Ressourcen
├── variables.tf             # Eingabevariablen
├── terraform.tfvars         # Sensible Zugangsdaten (Token, Keys)
├── cloud-init-master.yaml   # cloud-init für den Master (inkl. Velero + Ingress)
├── cloud-init-worker.yaml   # cloud-init für Worker-Nodes
├── .gitlab-ci.yaml          # CI/CD-Pipeline mit GitLab

```

## 🚀 Verwendung
⚠️ Vor der Ausführung müssen in terraform.tfvars gültige Zugangsdaten eingetragen werden.

1. Repository klonen
- git clone [https://github.com/bnymn/terraform-k8s-hetzner-cluster.git](https://github.com/bnymn97/terraform-kubernetes-setup.git)
2. Terraform initialisieren
- terraform init
3. Infrastruktur planen
- terraform plan
4. Infrastruktur anwenden
- terraform apply

📌 Hinweise
- Der SSH-Schlüssel muss vorher in deinem Hetzner-Projekt hinterlegt worden sein.

- Der Master-Node stellt die Kubernetes API bereit, startet Velero, und teilt das join.sh-Skript per HTTP mit den Workern.

- Die Worker-Nodes führen dieses Skript automatisch aus und treten dem Cluster bei.

- Der Ingress Controller wird als DaemonSet auf als "ingress" gelabelte Worker-Nodes ausgerollt.
