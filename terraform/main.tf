terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "pej-vpc" {
  source = "./vpc"
}

module "pej-ec2" {
  source = "./ec2"
  vpc_id = module.pej-vpc.vpc_id
  private_subnet_id = module.pej-vpc.private_subnet_id
  public_subnet_id = module.pej-vpc.public_subnet_id
}