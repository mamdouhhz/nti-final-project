variable "project_name" {
  description = "Name prefix used for tagging and naming resources"
  type        = string
}

variable "jenkins_instance_arn" {
  description = "ARN of the Jenkins EC2 instance to back up"
  type        = string
}

variable "backup_schedule" {
  description = "Cron expression for when the daily backup runs"
  type        = string
}

variable "backup_retention_days" {
  description = "How many days to retain each snapshot before deletion"
  type        = number
}