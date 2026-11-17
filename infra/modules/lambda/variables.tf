# Variables de entrada para el módulo Lambda
# TODO(reto): Declarar las variables necesarias para configurar la Lambda

variable "function_name" {
  description = "Nombre de la función Lambda"
  type        = string
}

variable "environment" {
  description = "Entorno de ejecución (ej: dev, prod)"
  type        = string
  default     = "dev"
}

variable "lambda_zip_path" {
  description = "Ruta al archivo ZIP que contiene el código de la Lambda"
  type        = string
}