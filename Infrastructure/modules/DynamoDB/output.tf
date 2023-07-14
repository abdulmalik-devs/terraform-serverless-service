output "dynamodb_arn" {
  value = aws_dynamodb_table.prod_table.arn
}