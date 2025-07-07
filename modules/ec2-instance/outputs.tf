output "instance_id" {
  description = "ID der EC2-Instanz"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "Öffentliche IP Adresse"
  value       = aws_instance.this.public_ip
}