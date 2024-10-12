# Main configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "tf-state-rs-student"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-lock-rs-student"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws-region
}