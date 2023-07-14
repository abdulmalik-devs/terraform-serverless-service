# Create an API Gateway
resource "aws_api_gateway_rest_api" "api" {
  name = "${var.api_name}"
}

# Create an API Gateway resource method "POST"
resource "aws_api_gateway_method" "post_method" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_rest_api.api.root_resource_id
  http_method   = "POST"
  authorization = "NONE"
}


# # Enable CORS for POST method
# resource "aws_api_gateway_method_response" "post_cors" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_rest_api.api.root_resource_id
#   http_method = aws_api_gateway_method.post_method.http_method
#   status_code = "200"

#   response_models = {
#     "application/json" = "Empty"
#   }

#   response_parameters = {
#     "method.response.header.Access-Control-Allow-Origin" = true
#   }
# }
#--------------------------------------------------------------------------

resource "aws_api_gateway_method_response" "cors_method_response_200" {
    rest_api_id   = aws_api_gateway_rest_api.api.id
    resource_id   = aws_api_gateway_rest_api.api.root_resource_id
    http_method   = aws_api_gateway_method.post_method.http_method
    status_code   = "200"

    response_parameters = {
        "method.response.header.Access-Control-Allow-Origin" = true
    }
    depends_on = [aws_api_gateway_method.post_method]
}


# Create an API Gateway Integration with Lambda Function
resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_rest_api.api.root_resource_id
  http_method             = aws_api_gateway_method.post_method.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = "${var.lambda_func_arn}"
}

resource "aws_api_gateway_integration_response" "lambda" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_rest_api.api.root_resource_id
  http_method = aws_api_gateway_method.post_method.http_method
  status_code = "200"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  depends_on = [
    aws_api_gateway_integration.lambda_integration
  ]
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "Dev"
  depends_on  = [aws_api_gateway_integration.lambda_integration]
}
