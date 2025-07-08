resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "pem" {
  key_name   = "${var.seminar}-${var.participant}"
  public_key = tls_private_key.ssh.public_key_openssh
}

resource "local_file" "private_key" {
  content = tls_private_key.ssh.private_key_pem
  filename = "${var.path}/${var.seminar}/${var.participant}.pem"
  file_permission = "0400"
}