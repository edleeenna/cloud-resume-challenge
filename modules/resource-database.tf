# Resource block defining an AWS DynamoDB table for visitor counting
resource "aws_dynamodb_table" "visitor_counter" {
  # Name of the DynamoDB table
  name           = "VisitorCounter"

  # Billing mode set to "PAY_PER_REQUEST" for on-demand pricing
  billing_mode   = "PAY_PER_REQUEST"

  # Primary key configuration using a single string attribute "id" as the hash key
  hash_key       = "id"
  
  # Attribute definition for the hash key "id"
  attribute {
    name = "id"
    type = "N"  # Number type
  }
  
  # Attribute definition for the "views" attribute
  attribute {
    name = "views"
    type = "N"  # Number type
  }

  # Definition of a global secondary index named "views-index"
  global_secondary_index {
    # Name of the global secondary index
    name               = "views-index"

    # Hash key for the global secondary index is set to the "views" attribute
    hash_key           = "views"

    # Projection type "ALL" includes all attributes in the index
    projection_type    = "ALL"
  }
}
