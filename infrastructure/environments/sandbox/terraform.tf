terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
 backend "s3" {
   encrypt = true    
   bucket   = "name-of-your-bucket-up-to-you"
   key      = "name-of-folder-you-want/terraform.tfstate"
   region   = "your-aws-region"
 }
}

# Creating AWS Provider
provider "aws" {
    region = "your-aws-region"
    access_key = var.terraform_aws_access_key
    secret_key = var.terraform_aws_secret_key
}

#Call module lambda Terraform
module "lambda-functions" {
  source                   = "../../modules/lambda-functions"
}