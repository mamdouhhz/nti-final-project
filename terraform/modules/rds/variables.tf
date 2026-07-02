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