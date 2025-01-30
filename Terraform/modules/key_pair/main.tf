resource "aws_key_pair" "ec2-acccenture-key-pair" {
  key_name = var.key_name
  public_key = file(var.public_key_path)
}