variable "public_path" {
  description = "The file path for the public directory"
  type        = string
  
}

variable "content_version" {
  description = "The content version (positive integer starting at 1)"
  type        = number

  validation {
    condition     = var.content_version >= 1
    error_message = "content_version must be a positive integer starting at 1"
  }
}

variable "custom_domain" {
  description = "The custom domain name"
  type        = string
  
}