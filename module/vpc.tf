resource "aws_vpc" "main" {
  cidr_block = var.VPC_CIDR
  tags = {
    Name = var.TAGS["ENV"]
  }
  //tags       = var.TAGS["ENV"]
}