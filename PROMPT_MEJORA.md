# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/modules/api_gateway/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/api_gateway/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/api_gateway/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/lambda/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/lambda/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/lambda/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `client/lib/data/datasources/order_remote_data_source.dart` — La fase "Configuración inicial de Terraform" se implementa aqui: este archivo es el ejercicio.
- `client/lib/data/repositories/order_repository_impl.dart` — La fase "Aprovisionamiento de API Gateway y Lambda" se implementa aqui: este archivo es el ejercicio.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `client` | `client/` | chapter, support | client | Flutter | Flutter |

## Orden de arranque

1. `cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=modules/api_gateway init -backend=false && terraform -chdir=modules/lambda init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=modules/api_gateway validate && terraform -chdir=modules/lambda validate` — componente `infra` (practice).
2. `cd client && flutter pub get && flutter analyze` — componente `client` (chapter, support).

### Contratos entre componentes

- `infra` expone http (api: https://${aws_api_gateway_rest_api.id}.execute-api.${var.region}.amazonaws.com/dev):
  - `GET /orders`

## Referencias no verificadas

Referencias no verificadas para: .dart. El analisis estatico no cubre esos lenguajes: que no se haya listado nada NO garantiza que no haya referencias colgando.

## Como saber que terminaste

```bash
(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=modules/api_gateway init -backend=false && terraform -chdir=modules/lambda init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=modules/api_gateway validate && terraform -chdir=modules/lambda validate) && (cd client && flutter pub get && flutter analyze)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform para la app movil

### Misión / candidato
Desplegar la API de la app de pedidos

### Reto
- Tema: Infraestructura como codigo para el backend de una app movil
- Seniority: senior-l2
- Tipo: practical
- Título: Despliegue de la API de la app de pedidos con Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Terraform — objetivo: Configurar el entorno de Terraform y crear el proyecto base. — entregable (NO resolver): Proyecto base de Terraform configurado y listo para su uso.
- Fase 2: Aprovisionamiento de API Gateway y Lambda — objetivo: Aprovisionar API Gateway y Lambda utilizando modulos reutilizables de Terraform. — entregable (NO resolver): API Gateway y Lambda aprovisionados y configurados utilizando modulos reutilizables de Terraform.
- Fase 3: Integración con la app movil — objetivo: Integrar la API aprovisionada con la app movil construida con Flutter. — entregable (NO resolver): App movil integrada con la API aprovisionada y funcionalidad de pull-to-refresh implementada.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/README.md ===
# Terraform Infrastructure for API Gateway and Lambda

## Project Structure

```
.
├── environments/
│   └── dev/
│       ├── main.tf          # Root module configuration for dev environment
│       ├── terraform.tfvars # Environment-specific variables
│       └── variables.tf     # Input variables for dev environment
├── modules/
│   ├── api_gateway/
│   │   ├── main.tf          # API Gateway resources
│   │   ├── variables.tf     # Input variables
│   │   └── outputs.tf       # Output values
│   └── lambda/
│       ├── main.tf          # Lambda function resources
│       ├── variables.tf     # Input variables
│       └── outputs.tf       # Output values
├── providers.tf             # Provider configurations
├── versions.tf              # Terraform version constraints
└── README.md                # This file
```

## Prerequisites

- Terraform 1.7.0 or later
- AWS CLI configured with appropriate credentials
- AWS account with permissions to create API Gateway and Lambda resources

## Setup Instructions

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Plan the deployment** (for dev environment):
   ```bash
   terraform plan -var-file="environments/dev/terraform.tfvars"
   ```

3. **Apply the configuration**:
   ```bash
   terraform apply -var-file="environments/dev/terraform.tfvars"
   ```

## Validation

After applying the configuration, verify the resources were created successfully:
- Check the API Gateway in the AWS Console
- Verify the Lambda function is deployed and has the correct triggers

## Environment Variables

The `environments/dev/terraform.tfvars` file contains environment-specific values. Modify these as needed for your deployment.

## Modules

### API Gateway Module
Creates an API Gateway with the specified configuration.

### Lambda Module
Creates a Lambda function with the specified runtime and handler.

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
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

// === ARCHIVO: infra/versions.tf ===
terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.100.0"
    }
  }
}

// === ARCHIVO: infra/providers.tf ===
provider "aws" {
  region = "us-east-1"
}

// === ARCHIVO: infra/modules/api_gateway/main.tf ===
# Módulo para crear un API Gateway REST API en AWS
# TODO(reto): Implementar los recursos necesarios para exponer el endpoint GET /orders
# que retornará una lista de pedidos. Debe integrarse con la Lambda definida en el módulo lambda.

# TODO(reto): implementa este bloque
# resource "aws_api_gateway_rest_api" "api" {
# }

# TODO(reto): implementa este bloque
# resource "aws_api_gateway_resource" "orders" {
#   # TODO(reto): Definir el recurso para /orders
# }

# TODO(reto): implementa este bloque
# resource "aws_api_gateway_method" "get_orders" {
#   # TODO(reto): Definir el método GET para /orders
# }

# TODO(reto): implementa este bloque
# resource "aws_api_gateway_integration" "lambda_integration" {
#   # TODO(reto): Configurar la integración con la Lambda
# }

# TODO(reto): implementa este bloque
# resource "aws_api_gateway_deployment" "deployment" {
#   # TODO(reto): Crear el despliegue de la API
# }

# TODO(reto): implementa este bloque
# resource "aws_lambda_permission" "apigw_lambda" {
#   # TODO(reto): Otorgar permisos a API Gateway para invocar la Lambda
# }

// === ARCHIVO: infra/modules/api_gateway/variables.tf ===
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

// === ARCHIVO: infra/modules/lambda/main.tf ===
# Módulo para crear una función Lambda en AWS
# TODO(reto): Implementar la función Lambda que retornará la lista de pedidos.
# Debe ser invocada por el API Gateway definido en el módulo api_gateway.

# TODO(reto): implementa este bloque
# resource "aws_lambda_function" "orders_lambda" {
# }

# TODO(reto): implementa este bloque
# resource "aws_iam_role" "lambda_exec" {
# }

# TODO(reto): implementa este bloque
# resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
# }

// === ARCHIVO: infra/modules/lambda/variables.tf ===
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

// === ARCHIVO: infra/environments/dev/variables.tf ===
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

// === ARCHIVO: infra/modules/api_gateway/outputs.tf ===
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

// === ARCHIVO: infra/modules/lambda/outputs.tf ===
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

// === ARCHIVO: infra/environments/dev/main.tf ===
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

// === ARCHIVO: client/android/app/src/main/AndroidManifest.xml ===
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.app">

    <application
        android:name="io.flutter.app.FlutterApplication"
        android:label="App"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
                android:name="io.flutter.embedding.android.NormalTheme"
                android:resource="@style/NormalTheme" />
            <meta-data
                android:name="io.flutter.embedding.android.SplashScreenDrawable"
                android:resource="@drawable/launch_background" />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>

// === ARCHIVO: client/lib/main.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'domain/usecases/get_orders.dart';
import 'data/repositories/order_repository_impl.dart';
import 'data/datasources/order_remote_data_source.dart';
import 'presentation/blocs/order_bloc/order_bloc.dart';
import 'presentation/blocs/order_bloc/order_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    const baseUrl = 'https://api.example.com';
    final remoteDataSource = OrderRemoteDataSourceImpl(dio: dio, baseUrl: baseUrl);
    final repository = OrderRepositoryImpl(remoteDataSource: remoteDataSource);
    final getOrders = GetOrders(repository);

    return MaterialApp(
      title: 'Order Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => OrderBloc(getOrders: getOrders)..add(const FetchOrders()),
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

// === ARCHIVO: client/pubspec.yaml ===
name: reto
description: Reto de aprendizaje.
publish_to: none
version: 1.0.0+1

environment:
  sdk: ">=3.12.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  dio: 5.11.1
  equatable: 2.1.0
  flutter_bloc: 8.1.6

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true

// === ARCHIVO: client/analysis_options.yaml ===
analyzer:
  exclude:
    - _pendiente/**

// === ARCHIVO: client/lib/data/models/order_model.dart ===
import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final String id;
  final String customerId;
  final List<OrderItemModel> items;
  final DateTime createdAt;
  final String status;
  final double total;

  const OrderModel({
    required this.id,
    required this.customerId,
    required this.items,
    required this.createdAt,
    required this.status,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      items: (json['items'] as List)
          .map((item) => OrderItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'items': items.map((item) => item.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'status': status,
      'total': total,
    };
  }

  @override
  List<Object?> get props => [id, customerId, items, createdAt, status, total];
}

class OrderItemModel extends Equatable {
  final String productId;
  final String productName;
  final int quantity;
  final double price;

  const OrderItemModel({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
    };
  }

  @override
  List<Object?> get props => [productId, productName, quantity, price];
}

// === ARCHIVO: client/lib/domain/entities/order.dart ===
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final String customerId;
  final List<OrderItem> items;
  final DateTime createdAt;
  final OrderStatus status;
  final double total;

  const Order({
    required this.id,
    required this.customerId,
    required this.items,
    required this.createdAt,
    required this.status,
    required this.total,
  }) : assert(total >= 0, 'Total must be non-negative');

  Order copyWith({
    String? id,
    String? customerId,
    List<OrderItem>? items,
    DateTime? createdAt,
    OrderStatus? status,
    double? total,
  }) {
    return Order(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [id, customerId, items, createdAt, status, total];
}

class OrderItem extends Equatable {
  final String productId;
  final String productName;
  final int quantity;
  final double price;

  const OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  }) : assert(quantity > 0, 'Quantity must be positive'),
       assert(price >= 0, 'Price must be non-negative');

  @override
  List<Object?> get props => [productId, productName, quantity, price];
}

enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled,
}

// === ARCHIVO: client/lib/domain/repositories/order_repository.dart ===
import '../entities/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders({bool refresh = false});
  Future<Order> getOrderById(String id);
  Future<void> refreshOrders();
}

// === ARCHIVO: client/lib/domain/usecases/get_orders.dart ===
import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrders {
  final OrderRepository repository;

  GetOrders(this.repository);

  Future<List<Order>> call({bool refresh = false}) async {
    try {
      return await repository.getOrders(refresh: refresh);
    } catch (e) {
      throw Exception('Failed to fetch orders: ${e.toString()}');
    }
  }
}

// === ARCHIVO: client/lib/presentation/blocs/order_bloc/order_event.dart ===
import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrders extends OrderEvent {
  final bool refresh;

  const FetchOrders({this.refresh = false});

  @override
  List<Object?> get props => [refresh];
}

class RefreshOrders extends OrderEvent {}

class OrderSelected extends OrderEvent {
  final String orderId;

  const OrderSelected(this.orderId);

  @override
  List<Object?> get props => [orderId];
}

class OrdersError extends OrderEvent {
  final String message;

  const OrdersError(this.message);

  @override
  List<Object?> get props => [message];
}

// === ARCHIVO: client/lib/data/datasources/order_remote_data_source.dart ===
// TODO(reto): Implementar la fuente de datos remota para órdenes
// Debe:
// 1. Consumir la API aprovisionada con Terraform (API Gateway + Lambda)
// 2. Manejar errores de red y timeout
// 3. Implementar caché local para evitar llamadas innecesarias
// 4. Soportar pull-to-refresh

import 'package:dio/dio.dart';
import '../models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getOrders();
  Future<OrderModel> getOrderById(String id);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final Dio dio;
  final String baseUrl;

  OrderRemoteDataSourceImpl({required this.dio, required this.baseUrl});

  @override
  Future<List<OrderModel>> getOrders() async {
    // TODO(reto): Implementar llamada a la API
    throw UnimplementedError();
  }

  @override
  Future<OrderModel> getOrderById(String id) async {
    // TODO(reto): Implementar llamada a la API
    throw UnimplementedError();
  }
}

// === ARCHIVO: client/lib/presentation/blocs/order_bloc/order_state.dart ===
import 'package:equatable/equatable.dart';
import '../../../domain/entities/order.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class OrderLoading extends OrderState {
  const OrderLoading();
}

class OrderLoaded extends OrderState {
  final List<Order> orders;
  final Order? selectedOrder;
  final bool isRefreshing;

  const OrderLoaded({
    required this.orders,
    this.selectedOrder,
    this.isRefreshing = false,
  });

  OrderLoaded copyWith({
    List<Order>? orders,
    Order? selectedOrder,
    bool? isRefreshing,
  }) {
    return OrderLoaded(
      orders: orders ?? this.orders,
      selectedOrder: selectedOrder ?? this.selectedOrder,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  @override
  List<Object?> get props => [orders, selectedOrder, isRefreshing];
}

class OrderError extends OrderState {
  final String message;
  final List<Order>? previousOrders;

  const OrderError({
    required this.message,
    this.previousOrders,
  });

  @override
  List<Object?> get props => [message, previousOrders];
}

// === ARCHIVO: client/lib/presentation/blocs/order_bloc/order_bloc.dart ===
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/order.dart';
import '../../../domain/usecases/get_orders.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetOrders getOrders;

  OrderBloc({required this.getOrders}) : super(const OrderInitial()) {
    on<FetchOrders>(_onFetchOrders);
    on<RefreshOrders>(_onRefreshOrders);
    on<OrderSelected>(_onOrderSelected);
    on<OrdersError>(_onOrdersError);
  }

  Future<void> _onFetchOrders(
    FetchOrders event,
    Emitter<OrderState> emit,
  ) async {
    final currentState = state;
    List<Order>? previousOrders;
    
    if (currentState is OrderLoaded) {
      previousOrders = currentState.orders;
    }

    emit(const OrderLoading());

    try {
      final orders = await getOrders(refresh: event.refresh);
      emit(OrderLoaded(orders: orders));
    } catch (e) {
      emit(OrderError(
        message: _extractErrorMessage(e),
        previousOrders: previousOrders,
      ));
    }
  }

  Future<void> _onRefreshOrders(
    RefreshOrders event,
    Emitter<OrderState> emit,
  ) async {
    final currentState = state;
    
    if (currentState is OrderLoaded) {
      emit(currentState.copyWith(isRefreshing: true));
    }

    try {
      final orders = await getOrders(refresh: true);
      emit(OrderLoaded(orders: orders));
    } catch (e) {
      emit(OrderError(
        message: _extractErrorMessage(e),
        previousOrders: currentState is OrderLoaded ? currentState.orders : null,
      ));
    }
  }

  void _onOrderSelected(
    OrderSelected event,
    Emitter<OrderState> emit,
  ) {
    final currentState = state;
    
    if (currentState is OrderLoaded) {
      final selectedOrder = currentState.orders.firstWhere(
        (order) => order.id == event.orderId,
        orElse: () => currentState.orders.first,
      );
      
      emit(currentState.copyWith(selectedOrder: selectedOrder));
    }
  }

  void _onOrdersError(
    OrdersError event,
    Emitter<OrderState> emit,
  ) {
    final currentState = state;
    emit(OrderError(
      message: event.message,
      previousOrders: currentState is OrderLoaded ? currentState.orders : null,
    ));
  }

  String _extractErrorMessage(dynamic error) {
    if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    }
    return error.toString();
  }
}

// === ARCHIVO: client/lib/data/repositories/order_repository_impl.dart ===
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Order>> getOrders({bool refresh = false}) async {
    // TODO(reto): Implementar la lógica de obtención de órdenes
    // 1. Llamar a remoteDataSource.getOrders()
    // 2. Convertir los OrderModel a Order (dominio)
    // 3. Retornar la lista de órdenes
    throw UnimplementedError('getOrders not implemented');
  }

  @override
  Future<Order> getOrderById(String id) async {
    // TODO(reto): Implementar la obtención de una orden por ID
    // 1. Llamar a remoteDataSource.getOrderById(id)
    // 2. Convertir el OrderModel a Order (dominio)
    // 3. Retornar la orden
    throw UnimplementedError('getOrderById not implemented');
  }

  @override
  Future<void> refreshOrders() async {
    // TODO(reto): Implementar la lógica de refresh
    // Typically this would clear cache and fetch fresh data
    throw UnimplementedError('refreshOrders not implemented');
  }
}
```
