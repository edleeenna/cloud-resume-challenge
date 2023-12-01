terraform {
    
  cloud {
    organization = "edleeennaorg"

    workspaces {
      name = "cloud-resume-aws"
    }
  }
}

provider "aws" {
  region     = "ap-southeast-2"
  access_key = "AKIAYTNWSFYCOO2K2QOD"
  secret_key = "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"

}


module "website_hosting" {
  source = "./modules/"
  public_path = var.website.public_path
  content_version = var.website.content_version
} 

