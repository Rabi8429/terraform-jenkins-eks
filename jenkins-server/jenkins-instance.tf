# resource "aws_instance" "Jenkins" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#   key_name = aws_key_pair.terraform-key-tf.id
#   vpc_sec
# }

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"


  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.terraform-key-tf.id
  monitoring             = true
  vpc_security_group_ids = [module.sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Name        = "Jenkins-Server"
    Terraform   = "true"
    Environment = "dev"
  }
  user_data = file("${path.module}/jenkins-install.sh")
}