terraform {
}

module "website_hosting" {
  source = "./modules/"
  public_path = var.website.public_path
  content_version = var.website.content_version
  custom_domain = var.website.custom_domain
} 
