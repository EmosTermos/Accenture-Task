module "ec2_accenture_key_pair" {
  source = "./modules/key_pair"
  key_name = var.key_name
}

module "ec2_accenture_sg_proxy" {
    source = "./modules/security_group"
    vpc_id = data.aws_vpc.default.id
    subnet_id = element(data.aws_subnets.default.ids, 0)
    instance_group_name = "ec2-accenture-proxy"
    ingress_rules = [ 
        {
            cidr_ipv4 = "${chomp(data.http.myip.response_body)}/32",
            from_port = 22,
            to_port = 22,
            ip_protocol = "tcp"
        },
        {
            cidr_ipv4 = "0.0.0.0/0",
            from_port = 80,
            to_port = 80,
            ip_protocol = "tcp"
        } 
    ]
}

module "ec2_accenture_sg_app" {
    source = "./modules/security_group"
    vpc_id = data.aws_vpc.default.id
    subnet_id = element(data.aws_subnets.default.ids, 0)
    instance_group_name = "ec2-accenture-app"
    ingress_rules = [ 
        {
            cidr_ipv4 = "${chomp(data.http.myip.response_body)}/32",
            from_port = 22,
            to_port = 22,
            ip_protocol = "tcp"
        },
        {
            referenced_security_group_id = module.ec2_accenture_sg_proxy.sg_id,
            from_port = 80,
            to_port = 80,
            ip_protocol = "tcp"
        }
    ]
}

module "ec2_accenture1" {
    source = "./modules/ec2"
    instance_name = "${var.instance_group_name}-1"
    vpc_id = data.aws_vpc.default.id
    subnet_id = element(data.aws_subnets.default.ids, 0)
    key_name = var.key_name
    security_group_id = module.ec2_accenture_sg_app.sg_id
}

module "ec2_accenture2" {
    source = "./modules/ec2"
    instance_name = "${var.instance_group_name}-2"
    vpc_id = data.aws_vpc.default.id
    subnet_id = element(data.aws_subnets.default.ids, 0)
    key_name = var.key_name
    security_group_id = module.ec2_accenture_sg_app.sg_id
}

module "ec2_accenture-proxy" {
    source = "./modules/ec2"
    instance_name = "${var.instance_group_name}-proxy"
    vpc_id = data.aws_vpc.default.id
    subnet_id = element(data.aws_subnets.default.ids, 0)
    key_name = var.key_name
    security_group_id = module.ec2_accenture_sg_proxy.sg_id
}