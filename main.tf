terraform {
   required_providers {
     aws = {
       source  = "hashicorp/aws"
       version = "~> 3.0"
     }
   }
 }


provider "aws" {
  access_key = "AKIA4P56N3H6C5HDZ676"
  secret_key = "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"
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    encrypt = false
    bucket= "tf-statefile-demo"
    dynamodb_table = "tf-state-lock-dynamo"
    key = "path/path/terraform-tfstate"
    region = "us-east-1"
    
  }
} 

resource "aws_instance" "example" {
  ami           = "ami-00b6a8a2bd28daf19"
  instance_type = "t2.micro"
}
