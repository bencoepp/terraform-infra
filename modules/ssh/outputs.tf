output "key" {
  description = "The name of the SSH key pair"
  value = aws_key_pair.pem.key_name
}