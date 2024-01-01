module "nginx_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "Nginx"
  instance_type               = "t2.micro"
  ami                         = "ami-0771803ae1861ec97"
  key_name                    = "18.11.23-key"
  associate_public_ip_address = true
  #vpc_security_group_ids = module.vpc-App.public_subnets.id
  subnet_id = module.vpc-App.public_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

