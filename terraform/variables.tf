variable "project_name" {
  description = "Name prefix used for tagging and naming resources"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "Availability zones to spread subnets across"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster, used for subnet discovery tags"
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

variable cluster_identifier {
  type        = string
  default     = "mysql-cluster"
}

variable allocated_storage {
  type        = number
  default     = 10      
}

variable storage_type {
  type        = string
  default     = "gp2"   
}

variable engine {
  type        = string
  default     = "mysql" 
}

variable instance_class {
  type        = string
  default     = "db.t3.micro" 
}

variable backup_retention_period {
  type        = number
  default     = 7
}

variable preferred_backup_window {
  type        = string
  default     = "07:00-09:00"
}

variable iops {
  type        = number
  default     = 1000
}