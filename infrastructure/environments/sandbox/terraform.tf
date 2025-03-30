terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
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