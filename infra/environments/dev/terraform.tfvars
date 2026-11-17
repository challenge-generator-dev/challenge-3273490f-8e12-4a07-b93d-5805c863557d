# Terraform variables for dev environment

# API Gateway variables
api_gateway_name = "dev-api-gateway"
api_gateway_description = "API Gateway for dev environment"
api_gateway_stage_name = "dev"

# Lambda variables
lambda_function_name = "dev-lambda-function"
lambda_handler = "index.handler"
lambda_runtime = "nodejs18.x"
lambda_memory_size = 128
lambda_timeout = 3
lambda_environment_variables = {
  ENV = "dev"
}

# AWS region
aws_region = "us-east-1"

# Account ID (example - replace with real account ID)
aws_account_id = "123456789012"