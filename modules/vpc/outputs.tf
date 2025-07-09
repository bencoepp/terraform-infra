output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.this.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value = aws_subnet.public.id
}

output "vpc_eks-id" {
  description = "The ID of the EKS-VPC"
  value = aws_vpc.eks.id
}