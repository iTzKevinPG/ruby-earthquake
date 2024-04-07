# API de Características Sísmicas

Esta API proporciona información sobre eventos sísmicos, permitiendo a los usuarios consultar datos sobre terremotos, incluyendo su magnitud, ubicación, y más.

## Modelo de Datos

El modelo `Earthquake` representa un evento sísmico e incluye los siguientes atributos:

- `mag`: Decimal, la magnitud del terremoto.
- `place`: String, la ubicación del terremoto.
- `time`: DateTime, la hora y fecha del evento.
- `url`: String, una URL con más información.
- `title`: String, el título del evento sísmico.
- `coordinates`: Decimal, latitud y longitud del evento.
- Otros atributos relevantes como `tsunami` (Boolean), `mag_type` (String), etc.

## Dependencias

Este proyecto utiliza las siguientes gemas:

- `rails` (~> 7.1.3): El framework para aplicaciones web.
- `sqlite3` (~> 1.4): Base de datos utilizada para el desarrollo.
- `puma` (>= 5.0): El servidor HTTP para Rails.
- `httparty`: Utilizada para hacer peticiones HTTP.
- `will_paginate`: Para la paginación de resultados en la API.

## Configuración y Ejecución

Para configurar y ejecutar el proyecto localmente, sigue estos pasos:

1. Clona el repositorio:

    `git clone [URL del repositorio]`

2. Instala las dependencias:

    `bundle install`

3. Crea y migra la base de datos:

    `rails db:create db:migrate`

4. Inicia el servidor Rails:

    `rails server`

## Consumo de la API

La API expone los siguientes endpoints:

- `GET /api/features`: Retorna una lista de eventos sísmicos.
- Parámetros opcionales: `page`, `per_page`, `filters[mag_type]`.
- `GET /api/features/:id`: Retorna un evento sísmico específico por su ID.

### POST Crear un Comentario

Este endpoint permite crear un comentario asociado a una característica sísmica específica (feature).

- **URL**: `/api/features/:feature_id/comments`
- **Método**: `POST`
- **URL Params**: 
  - `feature_id` [Integer]: El ID interno de la característica a la cual se le asocia el comentario.
- **Datos enviados en el body**:
  - `body` [Text]: El contenido del comentario.


### Ejemplos de Consumo

1. Obtener una lista de eventos sísmicos:

    ```bash
    curl "http://localhost:3000/api/features?page=1&per_page=10"`
    ```

2. Obtener un evento sísmico específico por ID:

    ```bash
    curl "http://localhost:3000/api/features/1"
    ```

3. Crear un comentario a un evento sísmico:


    ```bash
    curl -X POST http://localhost:3000/api/features/6713/comments \
    -H 'Content-Type: application/json' \
    -d '{"comment": {"body": "Este es un nuevo comentario"}}'
    ```

    ### Respuesta de éxito:
    Código: 201 CREATED
    
    Contenido: El comentario creado.
    ### Respuesta de error:
    Código: 422 UNPROCESSABLE ENTITY

    Contenido: Error indicando que el cuerpo del comentario no puede estar vacío.

