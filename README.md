# Math Application

This repository contains the code for a Math Application built using various AWS services. The application allows performing mathematical computations using a serverless architecture. The following AWS services are utilized:

- **Amplify**: Used to build and host the application.
- **API Gateway**: Invokes the Lambda function to perform the math operations.
- **Lambda**: Contains the Python code for the PowerOfMaths function.
- **IAM**: Grants necessary permissions to the Lambda function to interact with DynamoDB.
- **DynamoDB**: Stores the output of the math computations.

## Project Architecture

![Screenshot from 2023-07-14 18-22-54](https://github.com/abdulmalik-devs/terraform-serverless-service/assets/62616273/50aeba75-905d-4bf6-b4a6-036ee22cef74)

## Project Demo

[Screencast from 2023-07-14 15-38-59.webm](https://github.com/abdulmalik-devs/python_dictionary_app/assets/62616273/b496f182-3464-4b8d-8b86-931e76278fa2)


## Setup and Deployment

To set up and deploy the Math Application, follow the steps below:

1. Clone the repository:

   ```bash
   git clone <repository-url>
   ```
## Packages Needed to be Installed

- `Terraform` 
- `aws cli` 

- To Install `Terraform` use the below command:
  
```shell
sudo apt update
sudo apt install unzip
wget https://releases.hashicorp.com/terraform/1.0.3/terraform_1.0.3_linux_amd64.zip
unzip terraform_1.0.3_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform version
``` 

- To Install `AWS CLI` use the below command:
  
```shell
sudo apt update
sudo apt install awscli
aws --version
aws configure
``` 

## Deployement

- Terraform Init
- Terraform Validate
- Terraform Plan
- Terraform Apply

```shell
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
``` 

## Usage

The Math Application allows performing mathematical computations by making HTTP requests to the API Gateway endpoint. The following operations are supported:

- `POST /power-of-math`: Calculates the power of a number.

  Request body:

  ```json
  {
    "base": 2,
    "exponent": 3
  }
  ```

  Example response:

  ```json
  {
    "result": 8
  }
  ```

  This endpoint calculates the power of a number using the provided base and exponent.

## Permissions

The IAM role associated with the Lambda function is granted the necessary permissions to interact with DynamoDB. It has the following permissions:

- `dynamodb:PutItem`: Allows writing items to the DynamoDB table.
- `dynamodb:DeleteItem`: Allows deleting items from the DynamoDB table.
- `dynamodb:GetItem`: Allows retrieving items from the DynamoDB table.
- `dynamodb:UpdateItem`: Allows updating items in the DynamoDB table.
- `dynamodb:Query`: Allows querying items in the DynamoDB table.
- `dynamodb:Scan`: Allows scanning items in the DynamoDB table.

## Cleanup

To clean up and remove the deployed resources, run the following command:

```shell
terraform destroy --auto-approve
``` 

This will delete all the resources provisioned by Amplify for the Math Application.

## Contributing

Contributions to the Math Application are welcome. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## Author
- [AbduMalik Ololade](https://github.com/abdulmalik-devs) - (DevSecOps)