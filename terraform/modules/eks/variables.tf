variable "project_name" {
  description = "Name prefix used for tagging and naming resources"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS control plane"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for worker nodes (nodes should not be in public subnets)"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Public subnet IDs, included in cluster VPC config so the control plane can also see them (needed for public-facing ELBs)"
  type        = list(string)
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}