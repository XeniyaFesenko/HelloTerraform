terraform {
   required_providers {
     aws = {
       source  = "hashicorp/aws"
       version = "~> 3.0"
     }
   }
 }


provider "aws" {
  access_key = "$"
  secret_key = "$"
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    encrypt = false
    bucket= "tf-statefile-demo02"
    dynamodb_table = "tf-state-lock-dynamo"
    key = "path/path/tf-state-lock-dynamo"
    region = "us-east-1"
    
  }
} 

# resource "aws_instance" "example" {
#   ami           = "ami-00b6a8a2bd28daf19"
#   instance_type = "t2.micro"
# }

resource "aws_ecr_repository" "tf-ecr" {
  name                 = "ft-ect"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
