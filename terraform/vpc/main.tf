resource "aws_vpc" "pej" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "pej-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.pej.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    Name = "pej-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.pej.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "pej-private-subnet"
  }
}

resource "aws_internet_gateway" "pej" {
  vpc_id = aws_vpc.pej.id

  tags = {
    Name = "pej-internet-gateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.pej.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pej.id
  }

  tags = {
    Name = "pej-public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_nat_gateway" "pej" {
  allocation_id = aws_eip.pej_nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "pej-nat-gateway"
  }
}

resource "aws_eip" "pej_nat" {
  tags = {
    Name = "pej-nat-eip"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.pej.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.pej.id
  }

  tags = {
    Name = "pej-private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}