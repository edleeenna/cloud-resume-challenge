  resource "aws_route53_record" "wwww_a" {
  zone_id = "${data.aws_route53_zone.zone.id}"
  name    = var.custom_domain
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

// Certificate
resource "aws_acm_certificate" "cert" {
  domain_name       = var.custom_domain
  validation_method = "DNS"
   provider = aws.us_east

  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}

// Zone
data "aws_route53_zone" "zone" {
  name         = var.custom_domain
  private_zone = false
}