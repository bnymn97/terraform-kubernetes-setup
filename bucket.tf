resource "minio_s3_bucket" "backup-cluster" {
  bucket = "backup-cluster"
  acl    = "private"

  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}
