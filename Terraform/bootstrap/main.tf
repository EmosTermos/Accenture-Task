module "terraform_state_s3_bucket" {
  source = "../modules/storage/s3"
  bucket_name = var.bucket_name_bootstrap
  bucket_tags = {
    Name = var.bucket_name_bootstrap
  }
}