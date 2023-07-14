data "archive_file" "python_lambda_package" {  
  type        = "zip"  
  source_file = "./modules/Lambda/lambda_func.py"
  output_path = "./modules/Lambda/lambda_func.zip" 
}

resource "aws_lambda_function" "lambda_function" {
  function_name    = var.lambda_func_name

  # Use output zip file from the Terraform archive_file process
  filename         = data.archive_file.python_lambda_package.output_path
  source_code_hash = data.archive_file.python_lambda_package.output_base64sha256
  handler          = "lambda_func.lambda_handler"
  role             = "${var.iam_arn}"
  runtime          = "python3.9"
  timeout          = 10
}
