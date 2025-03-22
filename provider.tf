terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Use the latest version of the AWS Provider (5.x)
    }
  }

  required_version = ">= 1.0.0"  # Minimum Terraform version
}

provider "aws" {
  region = "us-east-1"  # Specify your AWS region
}
