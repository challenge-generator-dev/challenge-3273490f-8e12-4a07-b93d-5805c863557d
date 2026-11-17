# Outputs del módulo API Gateway
# Expone los recursos creados para consumo por otros componentes

# URL de invocación del API Gateway
output "api_gateway_invoke_url" {
  description = "URL de invocación del API Gateway"
  value = null # TODO(reto): aws_api_gateway_rest_api.api.id
}

# ID del API Gateway
output "api_gateway_id" {
  description = "ID del recurso API Gateway"
  value = null # TODO(reto): aws_api_gateway_rest_api.api.id
}

# ID del recurso de orders
output "orders_resource_id" {
  description = "ID del recurso /orders"
  value = null # TODO(reto): aws_api_gateway_resource.orders.id
}

# TODO(reto): Completar con los outputs necesarios para la integración con Lambda
# El estudiante debe definir qué valores necesitan exponerse desde este módulo
# para que otros componentes (como environments/dev) puedan consumirlos