
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution


resource "aws_cloudfront_origin_access_control" "default" {
  name                              = "OAC ${aws_s3_bucket.website_bucket.bucket}"
  description                       = "Origin Access Controls for Static Website Hosting ${aws_s3_bucket.website_bucket.bucket}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

locals {
  s3_origin_id = "MyS3Origin"
}



resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.website_bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.default.id
    origin_id                = local.s3_origin_id
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Static website hosting for: ${aws_s3_bucket.website_bucket.bucket}"
  default_root_object = "resume"

  aliases = [var.custom_domain]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

   

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.cert.arn
    ssl_support_method  = "sni-only"
  }
}

# Cannot get this to work :( , as it is better practice to have this in your CICD pipeline, I will implement that at a later date and just run this command manually
#resource "terraform_data" "invalidate_cache" {
# triggers_replace = terraform_data.content_version.output
#
#  provisioner "local-exec" {
#    command = "aws cloudfront create-invalidation --region us-east-1 --distribution-id ${aws_cloudfront_distribution.s3_distribution.id} --paths '/*'"    
# }

#}

