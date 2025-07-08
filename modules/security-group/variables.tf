variable "vpc" {
  description = "The VPC in which the security group will be created."
  type        = string
}

variable "participant" {
    description = "The name of the participant for whom the security group is created."
    type        = string
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
  default     = []
}