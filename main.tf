terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.58.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["/home/jbrnnan/.aws/config"]
  shared_credentials_files = ["/home/jbrennan/.aws/credentials"]
  profile                  = "default" 
  region = "us-west-1"
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_network.cidr
  instance_tenancy = "default"

  tags = {
    Name = "Example VPC"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.vpc_subnet_cidr.private

  tags = {
    Name = "Private"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.vpc_subnet_cidr.public

  tags = {
    Name = "Public"
  }
}


