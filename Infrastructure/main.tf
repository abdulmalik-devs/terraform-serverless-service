# Data source for VPC
data "aws_vpc" "default_vpc" {
  default = true
}

# Data source for Subnets
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

module "amplify" {
    source = "./modules/Amplify"

    amplify_name = "PowerOfMath"
}

module "apigateway" {
    source = "./modules/ApiGateway"

    api_name = "PowerOfMathApi"
    lambda_func_arn = module.lambda.lambda_arn
}

module "dynamodb" {
    source = "./modules/DynamoDB"

    dynamo_name = "PowerOfMathDatabase"
}

module "iam" {
    source = "./modules/IAM"

    lambda_rolename = "PowerOfMathRole"
    dynamodb_arn = module.dynamodb.dynamodb_arn
}

module "lambda" {
    source = "./modules/Lambda"

    lambda_func_name = "PowerOfMathFunction"
    iam_arn = module.iam.iam_role_arn
}
