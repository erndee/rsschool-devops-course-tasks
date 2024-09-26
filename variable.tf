variable "aws-region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "tf-state-bucket" {
  description = "Terraform state bucket name"
  default     = "tf-state-rs-student"
}

variable "tf-lock-table" {
  description = "Terraform state lock table name"
  default     = "tf-lock-rs-student"
}