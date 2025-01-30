terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-kd-accenture"
    key = "dev/terraform.tfstate"
    region = "eu-central-1"
    encrypt = true
  }
}