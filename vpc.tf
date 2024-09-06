resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
  
}
resource "aws_subnet" "subnet" {
    count = length(var.subnet_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = var.subnet_cidr[count.index]
    availability_zone = var.availability_zones[count.index]
    tags = {
      Name = "myvpc"
    }
  
}