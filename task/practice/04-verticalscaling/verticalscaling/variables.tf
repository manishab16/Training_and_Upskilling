variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Name prefix for resources"
  type        = string
  default     = "vertical-scaling-demo"
}

# Small and large instance types for vertical scaling
variable "small_instance_type" {
  description = "Smaller instance type"
  type        = string
  default     = "t3.micro"
}

variable "large_instance_type" {
  description = "Larger instance type"
  type        = string
  default     = "t3.small"
}

# CPU thresholds
variable "cpu_scale_up_threshold" {
  description = "CPU % above which we scale UP"
  type        = number
  default     = 70
}

variable "cpu_scale_down_threshold" {
  description = "CPU % below which we scale DOWN"
  type        = number
  default     = 20
}
