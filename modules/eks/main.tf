resource  = "eks" "eks"


cluster_name    = "my-eks-cluster"
  cluster_version = "1.30"

  vpc_id     = module.vpc.eks.id
  subnet_ids = module.vpc.eks-subnet.id

  cluster_name    = "my-cluster"
  cluster_version = "1.29"
  cluster_endpoint_public_access  = true

  eks_managed_node_groups = {
    example = {
      name = "my-node-group"
      instance_types = ["t3.nano"]
      min_size     = 1
      max_size     = 3
      desired_size = 2
    }
  }
  
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  tags = {
    Environment = "seminar"
  }
}