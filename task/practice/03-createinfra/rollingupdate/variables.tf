variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-west-1"   # change if you want
}

variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "rolling-demo"
}

# This is our application version.
# We will change this value later to trigger a rolling update.
variable "app_version" {
  description = "App version string displayed on the web page"
  type        = string
  default     = "v1"
}
