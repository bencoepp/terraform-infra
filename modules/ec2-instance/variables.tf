variable "ami_id" {
  description = "AMI ID für die EC2-Instanz"
  type        = string
  default     = "ami-02003f9f0fde924ea"
}

variable "instance_name" {
  description = "Wert des Name-Tags"
  type        = string
}

variable "instance_type" {
  description = "Größe der EC2-Instanz"
  type        = string
  default     = "t2.micro"
}

variable "aws_region" {
  description = "Region, in der die Instanz entsteht"
  type        = string
  default     = "eu-central-1"
}