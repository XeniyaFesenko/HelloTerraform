provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf-remote-state" {
  bucket = "tf-statefile-demo1"
  
  force_destroy = true

  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# resource "aws_dynamodb_table" "tf-remote-state-lock" {
#   hash_key = "LockID"
#   name = "tf-s3-app-lock"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# billing_mode = "PAY_PER_REQUEST"
# }


#################### Create Dynamodb Table #################

resource "aws_dynamodb_table" "terraform-lock" {
  hash_key = "LockID"
  name =  "terraform-test-lock"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    type =  "S"
    name = "LockID"
  }

}
