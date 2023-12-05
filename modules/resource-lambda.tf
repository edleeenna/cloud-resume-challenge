# Data block defining an IAM policy document for allowing Lambda to assume a role
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    # Specify Lambda as the service to allow
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    # Allow AssumeRole action
    actions = ["sts:AssumeRole"]
  }
}

# Resource block defining an IAM role for Lambda
resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  # Attach an inline policy to grant full DynamoDB access
  inline_policy {
    name = "lambda_dynamodb_policy"

    # Define the policy document for full DynamoDB access
    policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Action   = "dynamodb:*",
          Effect   = "Allow",
          Resource = aws_dynamodb_table.visitor_counter.arn, 
        },
      ]
    })
  }
}

# Data block for archiving Lambda source code into a zip file
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda/lambda_code.py"
  output_path = "visitorCount.zip"
}

# Resource block defining an AWS Lambda function
resource "aws_lambda_function" "test_lambda" {
  # Set the zip file containing Lambda source code
  filename      = "visitorCount.zip"
  function_name = "visitorCount"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_code.lambda_handler"

  # Calculate the hash of the Lambda source code
  source_code_hash = data.archive_file.lambda.output_base64sha256

  # Specify the runtime for the Lambda function
  runtime = "python3.10"
}

# Resource block defining a URL for the AWS Lambda function (test_latest)
resource "aws_lambda_function_url" "test_latest" {
  # Reference the function name and qualifier (alias) from the previous resource block
  function_name      = aws_lambda_function.test_lambda.function_name
  #qualifier          = "my_alias"
  authorization_type = "NONE"

  # Configure CORS settings for the Lambda function URL
  cors {
    allow_credentials = true
    allow_origins     = ["https://elenadeen.com"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }
}
