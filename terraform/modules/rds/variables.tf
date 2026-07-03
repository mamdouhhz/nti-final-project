variable "cluster_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
  default     = "mysql-cluster"
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 10
}

variable "storage_type" {
  description = "Storage type (gp2, gp3, io1)"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "mysql"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "preferred_backup_window" {
  description = "Preferred backup window"
  type        = string
  default     = "07:00-09:00"
}

variable "vpc_id" {
  description = "VPC ID for the RDS security group"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block, used to scope RDS security group ingress"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the DB subnet group"
  type        = list(string)
}