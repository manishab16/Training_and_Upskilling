resource "aws_lambda_function" "add_product" {
  function_name = "add-product"
  handler       = "handler.lambda_handler"
  runtime       = "python3.10"
  role          = aws_iam_role.lambda_role.arn
  filename = "${path.module}/../lambda/add_product/add_product.zip"

   source_code_hash = filebase64sha256(
    "${path.module}/../lambda/add_product/add_product.zip"
  )

  timeout = 3

  environment {
    variables = {
      TABLE_NAME = "Products"
    }
  }
}
