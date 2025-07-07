variable "name" {
    description = "Name of the VPC"
    type        = string
    default     = "default"
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