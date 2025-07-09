output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.this.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value = aws_subnet.public.id
}

output "eks_vpc_id" {
  description = "The ID of the eks VPC"
  value = aws_vpc.eks.id
}

output "eks_subnet_ids" {
  description = "The IDs of the subnets"
  value = values(aws_subnet.eks_public)[*].id
}