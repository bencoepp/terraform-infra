variable "name" {
    description = "Name of the VPC"
    type        = string
    default     = "default"
}

variable "region-availability_zone" {
    description = "AWS region for the VPC"
    type        = string
    default     = "eu-central-1a"
}

variable "seminar" {
    description = "Name of the seminar"
    type        = string
}

variable "azs" {
    description = "Exactly two AZs in the region"
    type        = list(string)
    default     = ["eu-central-1a", "eu-central-1b"]
}