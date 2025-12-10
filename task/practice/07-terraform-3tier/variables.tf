variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "three-tier-micro"
}

# DB credentials (used by backend + Lambda)
variable "db_username" {
  type    = string
  default = "appuser"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_name" {
  type    = string
  default = "appdb"
}

# Optional Datadog integration
variable "datadog_api_key" {
  type      = string
  sensitive = true
  default   = null
}

variable "datadog_app_key" {
  type      = string
  sensitive = true
  default   = null
}

