# Variables de entrada para el módulo API Gateway
# TODO(reto): Declarar las variables necesarias para configurar el API Gateway

variable "api_name" {
  description = "Nombre de la API Gateway"
  type        = string
}

variable "stage_name" {
  description = "Nombre del stage de despliegue (ej: dev, prod)"
  type        = string
  default     = "dev"
}

variable "lambda_invoke_arn" {
  description = "ARN de invocación de la Lambda que procesará las solicitudes"
  type        = string
}

variable "lambda_function_name" {
  description = "Nombre de la función Lambda"
  type        = string
}