variable "participants" {
  description = "The participants for the IAM policies"
  type        = set(string)
}

variable "seminar" {
  description = "The seminar for the IAM policy"
  type        = string
}