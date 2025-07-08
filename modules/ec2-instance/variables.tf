variable "ami_id" {
  description = "AMI ID für die EC2-Instanz"
  type        = string
  default     = "ami-02003f9f0fde924ea"
}

variable "instance_name" {
  description = "Wert des Name-Tags"
  type        = string
}

variable "vpc" {
  description = "ID der VPC, in der die Instanz entsteht"
  type        = string
}

variable "subnet" {
  description = "The subnet in which the security group will be created."
  type        = string
}

variable "security_group" {
  description = "ID der Sicherheitsgruppe, die der Instanz zugeordnet wird"
  type        = string
}

variable "seminar" {
  description = "Name des Seminars, in dem die Instanz erstellt wird"
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