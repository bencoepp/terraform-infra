resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
      Name = var.name
  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.region-availability_zone
  map_public_ip_on_launch = true

  tags = {
      Name = "${var.name}-public"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = { Name = "${var.name}-public-rt" }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_vpc" "eks" {
  cidr_block           = "172.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.seminar}-eks"
  }
}

locals {
  subnet_cidrs = ["172.0.1.0/24", "172.0.2.0/24"]
}

resource "aws_subnet" "eks_public" {
  for_each = {
    for idx, az in var.azs :
    az => {
      cidr = local.subnet_cidrs[idx]
    }
  }

  vpc_id                  = aws_vpc.eks.id
  availability_zone       = each.key
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.seminar}-eks-public-${each.key}"
  }
}

resource "aws_internet_gateway" "eks_public" {
  vpc_id = aws_vpc.eks.id
}

resource "aws_route_table" "eks_public" {
  vpc_id = aws_vpc.eks.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_public.id
  }

  tags = { Name = "${var.name}-eks-public-rt" }
}

resource "aws_route_table_association" "eks_public" {
  for_each = aws_subnet.eks_public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.eks_public.id
}