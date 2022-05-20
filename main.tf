# Creating a VPC for a project

resource "aws_vpc" "Rock1" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Rock1"
  }
}

# Creating two public subnets for the aws_vpc

resource "aws_subnet" "public-sub1" {
  vpc_id            = aws_vpc.Rock1.id
  cidr_block        = var.public-cidr1
  availability_zone = var.abz-1
  tags = {
    Name = "public-sub1"
  }
}

resource "aws_subnet" "public-sub2" {
  vpc_id            = aws_vpc.Rock1.id
  cidr_block        = var.public-cidr2
  availability_zone = var.abz-2

  tags = {
    Name = "public-sub2"
  }
}

# Creating two Private Subnets for the aws_vpc

resource "aws_subnet" "private-sub1" {
  vpc_id            = aws_vpc.Rock1.id
  cidr_block        = var.private-cidr1
  availability_zone = var.abz-3

  tags = {
    Name = "private-sub1"
  }
}

resource "aws_subnet" "private-sub2" {
  vpc_id            = aws_vpc.Rock1.id
  cidr_block        = var.private-cidr2
  availability_zone = var.abz-4

  tags = {
    Name = "private-sub2"
  }
}

# Creating two route tables,one public and the other private

resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.Rock1.id

  tags = {
    Name = "public-route"
  }
}

resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.Rock1.id

  tags = {
    Name = "private-route"
  }
}

# Associating subnets to the routes

resource "aws_route_table_association" "public-association1" {
  subnet_id      = aws_subnet.public-sub1.id
  route_table_id = aws_route_table.public-route.id
}

resource "aws_route_table_association" "public-association2" {
  subnet_id      = aws_subnet.public-sub2.id
  route_table_id = aws_route_table.public-route.id
}

resource "aws_route_table_association" "private-association1" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private-route.id
}

resource "aws_route_table_association" "private-association2" {
  subnet_id      = aws_subnet.private-sub2.id
  route_table_id = aws_route_table.private-route.id
}

# Creating an internet gateway

resource "aws_internet_gateway" "Rock-igw" {
  vpc_id = aws_vpc.Rock1.id

  tags = {
    Name = "Rock-igw"
  }
}

# Associating internet gateway with the public route

resource "aws_route" "Rock1" {
  route_table_id         = aws_route_table.public-route.id
  gateway_id             = aws_internet_gateway.Rock-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

