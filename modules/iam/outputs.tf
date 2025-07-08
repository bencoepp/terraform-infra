output "initial_console_passwords" {
  value     = {
    for k, v in aws_iam_user_login_profile.login_profile :
    k => v.password
  }
}