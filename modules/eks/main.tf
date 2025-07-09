resource "aws_iam_role" "eks_cluster_role"{
  name = "${var.cluster_name}-role"
  assume_role_policy = data.aws_iam_policy_document.eks_cluster_assume.json

  tags = {
    Seminar = var.seminar
    Name    = var.cluster_name
  }
}

data "aws_iam_policy_document" "eks_cluster_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_eks_cluster" "showcase" {
  name = var.cluster_name
  version = var.cluster_version
  role_arn = aws_iam_role.eks_cluster_role.arn
  vpc_config {
    subnet_ids = var.subnet_ids
    security_group_ids = []
  }

  tags = {
    Seminar = var.seminar
    Name    = var.cluster_name
  }
}

resource "aws_eks_node_group" "short_cluster" {
  cluster_name = aws_eks_cluster.showcase.name
  node_group_name = "short"
  node_role_arn = aws_iam_role.nodes.arn

  subnet_ids = var.subnet_ids
  scaling_config {
      desired_size = 1
      max_size     = 1
      min_size     = 1
  }

  instance_types = ["t2.medium"]
  disk_size = 30

  tags = {
    Seminar = var.seminar
    Name    = "${var.cluster_name}-short"
  }
}

resource "aws_iam_role" "nodes" {
  name = "${var.cluster_name}-nodes"
  assume_role_policy = data.aws_iam_policy_document.eks_nodes_assume.json
  tags = {
    Seminar = var.seminar
    Name    = "${var.cluster_name}-nodes"
  }
}

data "aws_iam_policy_document" "eks_nodes_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "nodes_Core" {
  role       = aws_iam_role.nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "nodes_CNI" {
  role       = aws_iam_role.nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "nodes_ContainerRegistry" {
  role       = aws_iam_role.nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}