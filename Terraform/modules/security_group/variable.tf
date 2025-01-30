variable "vpc_id" {
    description = "ID of the VPC  where this instanace should be created"
    type = string
}

variable "subnet_id" {
    description = "The ID of subnet in which to launch EC2 instance"
    type = string
}

variable "instance_group_name" {
    description = "value"
    type = string
}

variable "ingress_rules" {
  type= list(object({
    cidr_ipv4 = optional(string, null)
    referenced_security_group_id = optional(string, null)
    from_port = number
    to_port = number
    ip_protocol = string
  }))
}