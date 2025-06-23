terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
    minio = {
      source  = "aminueza/minio"
      version = ">= 2.0.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

provider "minio" {
  minio_server   = "nbg1.your-objectstorage.com"
  minio_user     = var.hcloud_access_key
  minio_password = var.hcloud_secret_key
  minio_region   = "nbg1"
  minio_ssl      = true
}

