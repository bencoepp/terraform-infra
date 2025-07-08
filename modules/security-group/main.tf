resource "aws_security_group" "this" {
  for_each = toset(var.participants)
  vpc_id = var.vpc
  description = "Security group for ${each.value}"
  name = "${each.value}-sg"

  dynamic "ingress" {
    for_each = var.ingress
    content {
      protocol = ingress.value.protocol
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      cidr_blocks = length(ingress.value.cidr_blocks) == 0 ? ["0.0.0.0/0"] : ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress
    content {
      protocol = egress.value.protocol
      from_port = egress.value.from_port
      to_port = egress.value.to_port
      cidr_blocks = length(egress.value.cidr_blocks) == 0 ? ["0.0.0.0/0"] : egress.value.cidr_blocks
    }
  }

  tags = {
      Name = "${each.value}-sg"
      Seminar = var.seminar
  }
}