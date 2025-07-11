terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  profile = "terraform"
}


locals {
  ec2_instances = flatten([
    for p in var.participants : [
      for n in range(p.instances) : {
        key   = "${p.name}-${n}"
        name  = p.name
        index = n
        own_vpc = p.own_vpc
      }
    ]
  ])
}

module "vpc" {
  source = "./modules/vpc"
  name = "vpc-${var.seminar_name}"
  seminar = var.seminar_name
}

module "security_group" {
  source = "./modules/security-group"
  vpc = module.vpc.vpc_id
  participants = [for p in var.participants : p.name]
  seminar = var.seminar_name
}

module "ssh" {
  for_each = {for p in var.participants : p.name => p}

  source = "./modules/ssh"
  seminar = var.seminar_name
  participant = each.value.name
}

module "ec2" {
  for_each = {
    for inst in local.ec2_instances : inst.key => inst
  }

  source = "./modules/ec2-instance"
  instance_name = each.value.key
  security_group = module.security_group.security_group_ids[each.value.name]
  seminar = var.seminar_name
  subnet = module.vpc.subnet_id
  ssh_key = "${var.seminar_name}-${each.value.name}"
}

module "iam" {
  source = "./modules/iam"
  participants = [for p in var.participants : p.name]
  seminar = var.seminar_name
}

output "password" {
  value = module.iam.initial_console_passwords
    sensitive = true
  description = "Initial console passwords for the IAM users created for the seminar participants."
}

output "ips" {
  description = "The public IP addresses of the EC2 instances created for the seminar participants."
  value = flatten(values(module.ec2)[*].public_ip)
}