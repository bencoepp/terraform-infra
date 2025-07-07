terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  profile = "terraform"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

resource "aws_instance" "ec2" {
  ami = "ami-02003f9f0fde924ea"
  instance_type = var.instance_type
  tags = {
    Name = "test-ec2-instance"
  }
}

output "instance_ip" {
  value = aws_instance.ec2.public_ip
  description = "Public IP address of the EC2 instance"
}