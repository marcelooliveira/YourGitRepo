terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
# backend "s3" {
#   encrypt = true    
#   bucket   = "s3-function-bucket-2"
#   key      = "s3-function-folder/terraform.tfstate"
#   region   = "us-east-1"
# }
}

# Creating AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = var.terraform_aws_access_key
  secret_key = var.terraform_aws_secret_key
}

#Call module lambda Terraform
module "lambda-functions" {
  source                   = "../../modules/lambda-functions"
}