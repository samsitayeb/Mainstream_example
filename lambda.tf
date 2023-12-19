# example lambda function
resource "aws_lambda_function" "example-lambda" {
  function_name                  = "test_function"
  role                           = aws_iam_role.lambda_role.arn 
  handler                        = "index.handler"
  runtime                        = "nodejs14.x"
  memory_size                    = 512
  timeout                        = 30
  tags                           = var.default_tags
  s3_bucket                      = aws_s3_bucket.example_bucket.bucket
  s3_key                         = "test_code.zip"
  reserved_concurrent_executions = 1
}
