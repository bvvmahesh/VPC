terraform {
  backend "s3" {
    bucket = "terraform-remote-state-file"
    key    = "VPC/NONPROD/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-locking"
  }
}