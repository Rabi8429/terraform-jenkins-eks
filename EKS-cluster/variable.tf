variable "aws_region" {
  type = string
}
# variable "secret_key" {
#   type = string
# }
# variable "access_key" {
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
variable "instance_types" {
  type = list(string)
}
variable "privet_subnets" {
  type = list(string)
}