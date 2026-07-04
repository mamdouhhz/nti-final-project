variable "project_name" {
  description = "Name prefix used for tagging and naming resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to launch the instance and security group into"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID to launch the Jenkins EC2 instance into"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the Jenkins server"
  type        = string
}

variable "key_pair_name" {
  description = "Name of an existing EC2 key pair used for SSH access"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the instance (restrict this to your IP, not 0.0.0.0/0)"
  type        = string
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 20
}

variable "ami_id" {
  description = "AMI ID for the Jenkins EC2 instance"
  type        = string
}