module "vpc-Bastion" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Bastion_VPC"
  cidr = "192.168.0.0/16"

  azs            = ["us-east-1a"]
  public_subnets = ["192.168.1.0/24"]

  enable_nat_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "Bastion Host"
  }
}

