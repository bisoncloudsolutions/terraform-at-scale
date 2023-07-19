locals {
    aws_region = "us-east-1"
}

generate "provider" {
    path = "project-us-east-1-provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
    terraform {
        required_providers {
            aws = {
                source = "hashicorp/aws"
                version = "~> 4.0"
            }
        }
    }

    provider "aws" {
        region = "${local.aws_region}"
    }
    EOF
}
