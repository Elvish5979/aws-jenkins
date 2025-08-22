terraform {
  backend "s3" {
    bucket  = "my-terraform-state-vishal-projects"
    key     = "jenkins/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}