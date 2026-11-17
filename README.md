# Despliegue de la API de la app de pedidos con Terraform

El objetivo es aprovisionar la infraestructura necesaria para la API de la app de pedidos utilizando Terraform. La infraestructura debe incluir API Gateway y Lambda. Se deben usar modulos reutilizables de Terraform para estos componentes. La app movil, construida con Flutter, consumirá esta API para mostrar el listado de pedidos con pull-to-refresh.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el backend de una app movil |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Tener el proyecto base del reto funcionando en tu máquina: clonar el repositorio, instalar las herramientas y verificar que compila y arranca antes de empezar a practicar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Instala las herramientas para ejecutar el proyecto: Flutter/Dart SDK · Terraform 1.5+.
- Clona el repositorio del reto (el enlace viene en la entrega del reto y en la sección "Repositorio del Proyecto" del PDF) y ábrelo en tu IDE.
- Instala las dependencias y compila ejecutando `(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=modules/api_gateway init -backend=false && terraform -chdir=modules/lambda init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=modules/api_gateway validate && terraform -chdir=modules/lambda validate) && (cd client && flutter pub get && flutter analyze)` en la raíz del repositorio.
- Confirma que el comando termina sin errores: el proyecto arranca y sus pruebas corren.
- Ubica los archivos de práctica: son los que contienen `TODO(reto)` (búscalos en el repositorio). Lee el README.md y el AGENTS.md antes de empezar.

**Entregable:** El proyecto compila/arranca sin errores con `(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=modules/api_gateway init -backend=false && terraform -chdir=modules/lambda init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=modules/api_gateway validate && terraform -chdir=modules/lambda validate) && (cd client && flutter pub get && flutter analyze)`.

<details>
<summary>Pistas de conocimiento</summary>

- Los archivos con `TODO(reto)` son el ejercicio: el resto del repositorio ya está resuelto y no hace falta tocarlo.
- Si el comando de verificación falla, revisa la versión de las herramientas instaladas antes de modificar código.
- AGENTS.md describe el reto, el comando de verificación y las reglas del repositorio.

</details>

### Fase 1: Configuración inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform y crear el proyecto base.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Configura el entorno de Terraform.
- Crea el proyecto base de Terraform.
- Define las variables necesarias para la configuración de la infraestructura.

**Entregable:** Proyecto base de Terraform configurado y listo para su uso.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de Terraform para la gestión de infraestructura como código.
- Creación y configuración de proyectos en Terraform.

</details>

### Fase 2: Aprovisionamiento de API Gateway y Lambda

**Objetivo:** Aprovisionar API Gateway y Lambda utilizando modulos reutilizables de Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Utiliza modulos reutilizables de Terraform para aprovisionar API Gateway y Lambda.
- Configura las propiedades necesarias para API Gateway y Lambda.
- Verifica que los recursos se hayan aprovisionado correctamente.

**Entregable:** API Gateway y Lambda aprovisionados y configurados utilizando modulos reutilizables de Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de modulos reutilizables en Terraform.
- Configuración de API Gateway y Lambda.

</details>

### Fase 3: Integración con la app movil

**Objetivo:** Integrar la API aprovisionada con la app movil construida con Flutter.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Configura la app movil para consumir la API aprovisionada.
- Implementa la funcionalidad de pull-to-refresh para mostrar el listado de pedidos.
- Verifica que la app movil se integra correctamente con la API.

**Entregable:** App movil integrada con la API aprovisionada y funcionalidad de pull-to-refresh implementada.

<details>
<summary>Pistas de conocimiento</summary>

- Integración de una app movil con una API.
- Implementación de pull-to-refresh en Flutter.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en este reto?
- **paraQueSirve**: ¿Para qué sirve aprovisionar API Gateway y Lambda en este reto?
- **comoSeUsa**: ¿Cómo se utilizan modulos reutilizables de Terraform en este reto?
- **erroresComunes**: ¿Qué errores comunes se pueden encontrar al aprovisionar infraestructura con Terraform?
- **queDecisionesImplica**: ¿Qué decisiones implica el uso de modulos reutilizables de Terraform en este reto?

## Criterios de Evaluacion

- Configuración inicial de Terraform.
- Aprovisionamiento de API Gateway y Lambda utilizando modulos reutilizables de Terraform.
- Integración de la app movil con la API aprovisionada.
- Implementación de pull-to-refresh en la app movil.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=modules/api_gateway init -backend=false && terraform -chdir=modules/lambda init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=modules/api_gateway validate && terraform -chdir=modules/lambda validate) && (cd client && flutter pub get && flutter analyze)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
