terraform {
  backend "s3" {
    bucket = "my-cicd-eks-buckets"
    key    = "EKS/terraform.tfstate"
    region = "us-east-2"
  }
}
