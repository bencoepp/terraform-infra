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

resource "aws_iam_user_login_profile" "login_profile" {
  for_each                = var.participants
  user                    = aws_iam_user.user[each.key].name
  password_reset_required = true
  password_length         = 20
}