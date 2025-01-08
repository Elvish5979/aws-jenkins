terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "t1"

  instance_type          = "t2.micro"
  key_name               = "Vishal-AWS-KEY"
  monitoring             = false
  vpc_security_group_ids = ["sg-0ca1c372cec02bf24"]
  subnet_id              = "subnet-03408a59f77a6e364"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
