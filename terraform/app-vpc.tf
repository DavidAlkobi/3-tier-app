module "vpc-App" {
  source = "terraform-aws-modules/vpc/aws"

  name = "App-vpc"
  cidr = "172.32.0.0/16"

  default_network_acl_egress = [ { "action": "allow", "cidr_block": "0.0.0.0/0", "from_port": 0, "protocol": "-1", "rule_no": 100, "to_port": 0 }, { "action": "allow", "from_port": 0, "ipv6_cidr_block": "::/0", "protocol": "-1", "rule_no": 101, "to_port": 0 } ]
  default_network_acl_ingress = [ { "action": "allow", "cidr_block": "0.0.0.0/0", "from_port": 0, "protocol": "-1", "rule_no": 100, "to_port": 0 }, { "action": "allow", "from_port": 0, "ipv6_cidr_block": "::/0", "protocol": "-1", "rule_no": 101, "to_port": 0 } ]
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["172.32.1.0/24", "172.32.2.0/24"]
  public_subnets  = ["172.32.3.0/24", "172.32.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "App"
  }
}

resource "aws_default_network_acl" "default" {
  default_network_acl_id = module.vpc-App.default_network_acl_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  // Add more specific rules for your use case
  // For example:
  // Allow HTTP and HTTPS outbound traffic
  egress {
    protocol   = 6  # TCP
    rule_no    = 101
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 443
  }
}
