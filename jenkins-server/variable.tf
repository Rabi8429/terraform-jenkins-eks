variable "aws_region" {
  type = string
}
# variable "secret_key" {
#   type = string
# }
# variable "access_key" {
#   type = string
# }
# variable "ports" {
#   type = list(number)
# }
# variable "image_name" {
#   type = string
# }
variable "vpc_cidr" {
  type = string
}
variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
}
variable "public_subnets" {
  type = list(string)
}
variable "instance_type" {
  type = string
}
# variable "aws_key_pair"{
#     type = string
# }
