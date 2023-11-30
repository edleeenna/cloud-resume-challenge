terraform {
    
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.25.0"
    }
  }
   cloud {
    organization = "edleeennaorg"

    workspaces {
      name = "cloud-resume-aws"
    }
  }
}

provider "aws" {

}



resource "aws_s3_bucket" "example" {
  bucket = "elenadcloudresumeaws"
    
} 