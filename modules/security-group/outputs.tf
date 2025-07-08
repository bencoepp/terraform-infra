output "security_group_id" {
  description = "The ID of the security group created for the participant."
  value = aws_security_group.this.id
}