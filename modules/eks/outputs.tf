output "cluster_id" {
  value       = aws_eks_cluster.showcase.id
  description = "EKS cluster ID"
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.showcase.endpoint
  description = "API server endpoint"
}

output "cluster_certificate_authority" {
  value       = aws_eks_cluster.showcase.certificate_authority[0].data
  description = "Base-64-encoded CA data"
}

output "node_role_arn" {
  value       = aws_iam_role.nodes.arn
  description = "IAM role ARN used by managed node groups"
}