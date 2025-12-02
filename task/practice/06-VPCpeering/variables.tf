variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}
variable "key_name" {
  description = "Existing EC2 key pair name in the region"
  type        = string
  default     = "my-tf-key" #
}

