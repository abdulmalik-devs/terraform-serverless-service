output "app_url" {
    value = module.amplify.app_url
}

output "api_deploy_arn" {
    value = module.apigateway.api_arn
}

output "lambda_invoke_arn" {
    value = module.lambda.lambda_arn
}