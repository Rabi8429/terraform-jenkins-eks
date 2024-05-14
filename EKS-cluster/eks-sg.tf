module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "EKS-SG"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "http"
      cidr_blocks = "10.0.0.0/8"
    },
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "http"
      cidr_blocks = "172.16.0.0/12"
    },
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "http"
      cidr_blocks = "192.168.0.0/16"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "http"
      cidr_blocks = "0.0.0.0/0"
    }

  ]
}
output "security_group_name" {
  value = module.sg.security_group_name
}
