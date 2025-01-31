variable "ami_id" {
  description = "The AMI to use for the EC2 instance"
  type        = string
  default     = "ami-07eef52105e8a2059"
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "A name tag for the EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC  where this instanace should be created"
  type        = string
}

variable "subnet_id" {
  description = "The ID of subnet in which to launch EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name to use"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "user_data" {
  description = "Scripts"
  type        = string
}