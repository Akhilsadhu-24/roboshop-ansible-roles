terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0" # aws provider version not terraform version
    }
  }
}

provider "aws" {
   region  = "us-east-1"
}