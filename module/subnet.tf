resource "aws_subnet" "main" {
  count         = length(data.aws_availability_zones.available.names)
  vpc_id        = aws_vpc.main.id
  cidr_block    =  cidrsubnet("10.100.0.0/16", 8, count.index)
  tags          = {
    Name        = "${var.TAGS["ENV"]}-subnet-${count.index+1}"
  }
}
