module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "Demo-eks-cluster"
  cluster_version = "1.29"

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  #   control_plane_subnet_ids = ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = var.instance_types
  }

  eks_managed_node_groups = {
    demo-nodegroup = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = var.instance_types

    }

  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  # access_entries = {
  #   # One access entry with a policy associated
  #   example = {
  #     kubernetes_groups = []
  #     principal_arn     = "arn:aws:iam::487717439876:role/aws-service-role/eks-nodegroup.amazonaws.com/AWSServiceRoleForAmazonEKSNodegroup"

  #     policy_associations = {
  #       example = {
  #         policy_arn = "arn:aws:iam::487717439876:role/aws-service-role/eks.amazonaws.com/AWSServiceRoleForAmazonEKS"
  #         access_scope = {
  #           namespaces = ["default"]
  #           type       = "namespace"
  #         }
  #       }
  #     }
  #   }
  # }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
output "cluster_name" {
  value = module.eks.cluster_name
}