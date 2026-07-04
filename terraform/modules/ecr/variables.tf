variable "project_name" {
  description = "Name prefix used for tagging"
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