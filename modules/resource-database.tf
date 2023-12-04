resource "aws_dynamodb_table" "visitor_counter" {
  name           = "VisitorCounter"
  billing_mode   = "PAY_PER_REQUEST"  # On-demand pricing
  hash_key       = "id"
  attribute {
    name = "id"
    type = "N"
  }
}
