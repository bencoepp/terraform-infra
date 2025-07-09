variable "cluster_name" {
    description = "The name of the EKS cluster"
    type        = string
}

variable "cluster_version" {
    description = "The version of the EKS cluster"
    type        = string
    default = "1.30"
}

variable "vpc_id" {
    description = "The ID of the VPC where the EKS cluster is deployed"
    type        = string
}

variable "subnet_ids" {
    description = "The IDs of the subnets where the EKS cluster is deployed"
    type        = list(string)
}

variable "seminar" {
    description = "The seminar name for the EKS cluster"
    type        = string
}