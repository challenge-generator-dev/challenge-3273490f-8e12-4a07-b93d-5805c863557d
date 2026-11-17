# Outputs del módulo Lambda
# Expone la función Lambda creada para consumo por otros componentes

# ARN de la función Lambda
output "lambda_function_arn" {
  description = "ARN de la función Lambda"
  value = null # TODO(reto): aws_lambda_function.orders_lambda.arn
}

# Nombre de la función Lambda
output "lambda_function_name" {
  description = "Nombre de la función Lambda"
  value = null # TODO(reto): aws_lambda_function.orders_lambda.function_name
}

# ARN del rol de ejecución
output "lambda_role_arn" {
  description = "ARN del rol de ejecución de Lambda"
  value = null # TODO(reto): aws_iam_role.lambda_exec.arn
}

# TODO(reto): Completar con los outputs necesarios para la integración con API Gateway
# El estudiante debe definir qué valores necesitan exponerse desde este módulo
# para que el módulo de API Gateway pueda invocar esta función