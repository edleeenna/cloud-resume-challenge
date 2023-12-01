terraform {
    
  cloud {
    organization = "edleeennaorg"

    workspaces {
      name = "cloud-resume-aws"
    }
  }
}

provider "aws" {
 
}


module "website_hosting" {
  source = "./modules/"
  public_path = var.website.public_path
  content_version = var.website.content_version
} 

