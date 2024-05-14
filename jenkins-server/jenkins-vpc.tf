module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-jenkins-vpc"
  cidr = var.vpc_cidr

  azs                     = data.aws_availability_zones.azs.names
  public_subnets          = var.public_subnets
  enable_dns_hostnames    = true
  map_public_ip_on_launch = true



  tags = {
    Name        = "my-jenkins-vpc"
    Terraform   = "true"
    Environment = "dev"
  }
  public_subnet_tags = {
    Name      = "Jenkins-public-subnet"
    Terraform = "true"
  }
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public-subnets" {
  value = module.vpc.public_subnets
}