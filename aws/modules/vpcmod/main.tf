


resource "aws_vpc" "aws_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "aws_pubsub" {
  vpc_id                  = aws_vpc.aws_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.region_azs[0]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "aws_pvtsub" {
  vpc_id            = aws_vpc.aws_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.region_azs[0]
}

resource "aws_subnet" "aws_pvtsub2" {
  vpc_id            = aws_vpc.aws_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = var.region_azs[1]
}

resource "aws_internet_gateway" "aws_igw" {
  vpc_id = aws_vpc.aws_vpc.id
}

resource "aws_route_table" "aws_pubrt" {
  vpc_id = aws_vpc.aws_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_igw.id
  }
}

resource "aws_route_table_association" "aws_pubassc" {
  subnet_id      = aws_subnet.aws_pubsub.id
  route_table_id = aws_route_table.aws_pubrt.id
}

