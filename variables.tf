variable "website" {
  type = object({
    public_path = string
    content_version = string

  })
}