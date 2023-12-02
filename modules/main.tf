terraform {
    
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.25.0"
    }
}
}

// second provider because aws certificate manager only allows certificates in us_east-1
provider "aws" {
  alias  = "us_east"
  region = "us-east-1"
 
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}