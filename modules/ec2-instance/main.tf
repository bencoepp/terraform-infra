resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet
  vpc_security_group_ids = var.security_group != "" ? [var.security_group] : []
  key_name = var.ssh_key

  tags = {
    Name = var.instance_name
    Seminar = var.seminar
  }
}