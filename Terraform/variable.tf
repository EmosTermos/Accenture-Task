
variable "aws_region" {
  description = "AWS region name"
  type = string
  default = "eu-central-1"
}

variable "key_name" {
  description = "SSH Key Pair Name"
  type = string
  default = "my-key-ec2-accenture"
}

variable "instance_group_name" {
  description = "Group Name"
  type = string
  default = "ec2_accenture"
}