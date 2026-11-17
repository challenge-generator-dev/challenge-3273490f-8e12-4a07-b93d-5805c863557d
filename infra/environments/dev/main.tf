# Configuración del entorno de desarrollo
# Orkestra los módulos de API Gateway y Lambda para el entorno dev

# Módulo API Gateway
module "api_gateway" {
  source = "../../modules/api_gateway"

  api_name           = var.api_name
  stage_name         = "dev"
  lambda_invoke_arn  = module.lambda.lambda_function_arn
  lambda_function_name = module.lambda.lambda_function_name
}

# Módulo Lambda
module "lambda" {
  source = "../../modules/lambda"

  function_name   = var.lambda_function_name
  environment     = var.environment
  lambda_zip_path = var.lambda_zip_path
}

# TODO(reto): Completar con la integración entre API Gateway y Lambda
# El estudiante debe implementar:
# 1. La invocación de Lambda desde API Gateway (integration)
# 2. Los permisos necesarios (lambda_permission)
# 3. La URL final del endpoint
# 
# El endpoint esperado es:
# https://${aws_api_gateway_rest_api.id}.execute-api.${var.region}.amazonaws.com/dev/orders

# Output con la URL completa del endpoint de pedidos
output "orders_endpoint_url" {
  description = "URL completa del endpoint de pedidos"
  value       = "https://${module.api_gateway.api_gateway_invoke_url}.execute-api.us-east-1.amazonaws.com/dev/orders"
}