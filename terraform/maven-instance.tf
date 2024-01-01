module "maven_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "Maven"
  ami                         = "ami-083d245a911ab4b30"
  instance_type               = "t2.micro"
  key_name                    = "18.11.23-key"
  associate_public_ip_address = true
  #vpc_security_group_ids = module.vpc-App.public_subnets.id
  subnet_id = module.vpc-App.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

