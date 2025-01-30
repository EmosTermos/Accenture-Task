variable "bucket_name" {
  description = "Backend bucket name"
  type = string
  default = "s3_bucket_backend"
}

variable "bucket_tags" {
  description = "A map of tags to assign to the bucket"
  type = map(string)
  default = {}
}