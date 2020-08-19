# Query data from AWS
data "aws_vpc" "aws_vpc_default" {
  default = true
}

data "aws_security_group" "aws_security_group_default" {
  name = var.sg_name
}

data "aws_subnet" "aws_subnet_selected" {
  vpc_id            = data.aws_security_group.aws_security_group_default.vpc_id
  availability_zone = "us-west-1a"
}

# Module web
module "web" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "~> 2.0"
  name                        = var.name
  instance_count              = var.server_count
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  ipv6_address_count          = 0
  vpc_security_group_ids      = [data.aws_security_group.aws_security_group_default.id]
  subnet_id                   = data.aws_subnet.aws_subnet_selected.id
  monitoring                  = true
  key_name                    = var.key_name
  tags = {
    tier        = "web"
    environment = "dev"
  }
}
