module "secure_bucket" {
  source             = "../../modules/S3-Bucket"
  bucket_name        = "my-tf-example-bucket-jenkins"
  versioning_enabled = true
  tags = {
    Environment = "dev"
    Owner       = "Vishal"
    Project     = "Jenkins"
  }
}