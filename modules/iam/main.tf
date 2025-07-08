resource "aws_iam_group" "seminar_group" {
  name = var.seminar
  path = "/"
}

resource "aws_iam_user" "user" {
  for_each = var.participants
  name     = each.value
  path     = "/"
}

resource "aws_iam_group_membership" "seminar_group_membership" {
  group = aws_iam_group.seminar_group.name
  users = [for user in aws_iam_user.user : user.name]
  name  = "${var.seminar}-group-membership"
}