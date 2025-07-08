variable "vpc" {
  description = "The VPC in which the security group will be created."
  type        = string
}

variable "participants" {
    description = "The name of the participants for whom the security groups is created."
    type        = list(string)
}

variable "ingress" {
  description = "List of ingress rules for the VPC"
  type        = list(object({
    protocol = string
    from_port = number
    to_port   = number
    cidr_blocks = list(string)
  }))
  default     = [
    {
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_blocks = []
    },
  ]
}

variable "egress" {
  description = "List of egress rules for the VPC"
  type        = list(object({
    protocol = string
    from_port = number
    to_port   = number
    cidr_blocks = list(string)
  }))
  default     = [
    {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = []
    }
  ]
}

variable "seminar" {
  description = "Name of the seminar for which the security group is created."
  type        = string
}