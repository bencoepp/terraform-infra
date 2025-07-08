output "security_group_ids" {
  description = "Map of security group IDs by participant name"
  value = {
    for k, v in aws_security_group.this : k => v.id
  }
}