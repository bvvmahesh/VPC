resource "aws_subnet" "main" {
  count         = length(data.aws_availability_zones.available.names)
  vpc_id        = aws_vpc.main.id
  cidr_block    = "10.100.0.0/24"
  tags = {
    Name = "Main"
  }
}
