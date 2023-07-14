resource "aws_dynamodb_table" "prod_table" {
  name           = var.dynamo_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 5  # adjust as needed
  write_capacity = 5  # adjust as needed
  hash_key       = "id"

  attribute {
    name = "id"
    type = "N"  # Assuming 'id' is a number. If not, use "S" for String.
  }
}
