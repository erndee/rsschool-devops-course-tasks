# Create an S3 bucket to store the Terraform state
resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = var.tf-state-bucket

  tags = {
    Name        = "TF State Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Create a DynamoDB table to store the Terraform state lock
resource "aws_dynamodb_table" "tf_lock_table" {
  name         = var.tf-lock-table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}