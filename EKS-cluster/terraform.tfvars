aws_region = "us-east-2"
vpc_cidr       = "192.0.0.0/16"
azs            = ["us-east-2a", "us-east-2b"]
public_subnets = ["192.0.2.0/24", "192.0.3.0/24"]
privet_subnets = ["192.0.23.0/24", "192.0.26.0/24"]
instance_types = ["t2.micro"]