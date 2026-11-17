# Variables específicas para el entorno dev
# TODO(reto): Declarar variables específicas para el entorno dev.
# No duplicar variables ya declaradas en los módulos.

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "api_name" {
  description = "Nombre de la API Gateway para el entorno dev"
  type        = string
  default     = "orders-api-dev"
}

variable "lambda_function_name" {
  description = "Nombre de la función Lambda para el entorno dev"
  type        = string
  default     = "get-orders-dev"
}

variable "lambda_zip_path" {
  description = "Ruta al archivo ZIP con el código de la Lambda para dev"
  type        = string
  default     = "./lambda_code/orders_lambda.zip"
}