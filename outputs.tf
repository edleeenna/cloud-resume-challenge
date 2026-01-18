 output "bucket_name" {
   description = "Bucket name for our static website hosting"
   value = module.website_hosting.bucket_name
 }
 
 output "website_endpoint" {
   description = "S3 static website hosting endpoint"
   value = module.website_hosting.website_endpoint
 }
 
 output "cloudfront_url" {
   description = "The CloudFront distribution Domain Name"
   value = module.website_hosting.domain_name
 }

 output "lambda_url" {
   description = "The Lambda function URL"
   value = module.website_hosting.lambda_url
 }