terraform {
   required_providers {
     aws = {
       source  = "hashicorp/aws"
       version = "~> 3.0"
     }
   }
 }


provider "aws" {
  access_key = "AKIAWU23RWYCJE4SZ4MO"
  secret_key = "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"
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    encrypt = false
    bucket= "tf-statefile-demo02"
    dynamodb_table = "tf-state-lock-dynamo"
    key = "path/path/terraform-tfstate"
    region = "us-east-1"
    
  }
} 

resource "aws_instance" "example" {
  ami           = "ami-00b6a8a2bd28daf19"
  instance_type = "t2.micro"
}
