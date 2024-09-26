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
    bucket         = var.tf-state-bucket
    key            = "terraform.tfstate"
    region         = var.aws-region
    dynamodb_table = var.tf-lock-table
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws-region
}