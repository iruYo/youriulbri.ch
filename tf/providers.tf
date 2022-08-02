terraform {
  required_version = "~> 1.2.1"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.24.0"
    }
  }

  backend "s3" {
    bucket = "youriulbri.ch-terraform"
    key = "prod/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}

provider "aws" {
  alias = "acm_provider"
  region = "us-east-1"
}