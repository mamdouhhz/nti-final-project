variable "project_name" {
  description = "Name prefix used for tagging"
  type        = string
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