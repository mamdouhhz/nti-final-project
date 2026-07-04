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

variable "eks_node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
}

variable "eks_node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "eks_node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "eks_node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "rds_cluster_identifier" {
  type    = string
  default = "mysql-cluster"
}

variable "rds_allocated_storage" {
  type    = number
  default = 10
}

variable "rds_storage_type" {
  type    = string
  default = "gp2"
}

variable "rds_engine" {
  type    = string
  default = "mysql"
}

variable "rds_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "rds_backup_retention_period" {
  type    = number
  default = 7
}

variable "rds_preferred_backup_window" {
  type    = string
  default = "07:00-09:00"
}

variable "rds_iops" {
  type    = number
  default = 1000
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

variable "repo_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "image_tag_mutability" {
  description = "Whether image tags can be overwritten (MUTABLE) or not (IMMUTABLE)"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Whether to scan images for vulnerabilities automatically on push"
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name for ELB access logs"
  type        = string
}

variable "log_retention_days" {
  description = "Number of days to retain ELB access logs before deletion"
  type        = number
  default     = 30
}

variable "backup_schedule" {
  description = "Cron expression for when the daily backup runs"
  type        = string
}

variable "backup_retention_days" {
  description = "How many days to retain each snapshot before deletion"
  type        = number
}