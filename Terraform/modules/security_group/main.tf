resource "aws_security_group" "ec2-accenture-security-group" {
    name = "${var.instance_group_name}-sg"
    description = "Security group for ec2 accenturekey"
    vpc_id = var.vpc_id
}


resource "aws_vpc_security_group_ingress_rule" "ec2-accenture-ingress-dynamic" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule }

  security_group_id = aws_security_group.ec2-accenture-security-group.id

  from_port = each.value.from_port
  to_port = each.value.to_port
  ip_protocol = each.value.ip_protocol

  cidr_ipv4 = lookup(each.value, "cidr_ipv4", null)
  referenced_security_group_id = lookup(each.value, "referenced_security_group_id", null)
}

resource "aws_vpc_security_group_egress_rule" "ec2-accenture-egress" {
  security_group_id = aws_security_group.ec2-accenture-security-group.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 0
  to_port = 0
  ip_protocol = "-1"
}