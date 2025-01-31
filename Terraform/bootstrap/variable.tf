variable "bucket_name_bootstrap" {
  description = "Name for s3 bucket responsible for storing state of terraform"
  type        = string
  default     = "terraform-state-bucket-kd-accenture"
}