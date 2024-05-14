resource "aws_key_pair" "terraform-key-tf" {
  key_name   = "terraform-key1"
  public_key = file("/home/master/terraform/AWS-terraform/Aws-services/rsa.pub") # This is for when your public key stored in loacally different folder/directory.  
}