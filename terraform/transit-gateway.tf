module "tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = "~> 2.0"

  name                                  = "my-tgw"
  description                           = "My TGW shared with several other AWS accounts"
  share_tgw                             = false
  enable_auto_accept_shared_attachments = true

  vpc_attachments = {
    Bastion_vpc = {
      vpc_id       = module.vpc-Bastion.vpc_id
      subnet_ids   = module.vpc-Bastion.public_subnets
      dns_support  = true
      ipv6_support = false
    },
    App_vpc = {
      vpc_id       = module.vpc-App.vpc_id
      subnet_ids   = module.vpc-App.private_subnets
      dns_support  = true
      ipv6_support = false
    }
  }
}
# Reference attachment_id after the attachments are created
