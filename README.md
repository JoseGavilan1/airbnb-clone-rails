# 🏠 Airbnb Clone MVP - Full Stack Rails 8

Este es un **Producto Mínimo Viable (MVP)** de una plataforma de arriendos vacacionales inspirado en Airbnb. El proyecto demuestra el dominio de una arquitectura Full Stack utilizando **Ruby on Rails 8**, con un enfoque particular en la experiencia de usuario (UX), la seguridad y la integración de servicios de geolocalización.

## 🚀 Características Principales

### 🔐 Gestión de Usuarios y Seguridad
* **Autenticación Robusta:** Implementación de Devise para el registro, inicio de sesión y protección de rutas.
* **Autorización de Dueños:** Sistema de seguridad a nivel de controlador que garantiza que solo el dueño de una propiedad pueda editarla o eliminarla.

### 🏨 Gestión de Propiedades y Contenido
* **CRUD Completo:** Creación, lectura, actualización y eliminación de alojamientos.
* **Active Storage:** Gestión de imágenes reales vinculadas a cada propiedad.
* **Buscador Inteligente:** Motor de búsqueda por ubicación optimizado con PostgreSQL (`ILIKE`) para resultados precisos.

### 📅 Sistema de Reservas (Bookings)
* **Lógica Transaccional:** Motor que calcula automáticamente la duración de la estadía y el precio total basado en la tarifa por noche.
* **Dashboards Duales:**
    * **Vista del Huésped:** Panel "Mis Viajes" con el historial de reservas y recibos.
    * **Vista del Anfitrión:** Panel "Mis Propiedades" con desglose de ingresos y quién ha reservado cada casa.

### 🌟 Comunidad y Reseñas
* **Sistema de Ratings:** Calificación de 1 a 5 estrellas y comentarios por propiedad.
* **Validaciones de Integridad:** Reglas de negocio que aseguran la calidad de los datos en las reseñas.

### 🗺️ Geolocalización Pro (Nivel Avanzado)
* **Mapas Interactivos:** Integración de Leaflet.js y OpenStreetMap (sin APIs de pago).
* **Geocoding Dinámico:** El sistema busca coordenadas automáticamente al ingresar una dirección.
* **Pin Arrastrable (Precision GPS):** El anfitrión puede mover el marcador en un mapa para fijar la ubicación exacta de la casa, guardando latitud y longitud con precisión decimal de 6 dígitos.

## 🛠️ Tech Stack

* **Lenguaje:** Ruby 3.x
* **Framework:** Ruby on Rails 8
* **Base de Datos:** PostgreSQL (Producción-ready)
* **Frontend:** Tailwind CSS (Diseño responsivo y moderno)
* **Mapas:** Leaflet.js + OpenStreetMap API
* **Gestión de Archivos:** Active Storage

## ⚙️ Instalación Local

Para ejecutar este proyecto en tu máquina local:

1.  **Clona el repositorio:**
    ```bash
    git clone [https://github.com/tu-usuario/nombre-del-repo.git](https://github.com/tu-usuario/nombre-del-repo.git)
    cd nombre-del-repo
    ```

2.  **Instala las dependencias:**
    ```bash
    bundle install
    ```

3.  **Configura la base de datos:**
    ```bash
    rails db:prepare
    ```

4.  **Inicia el servidor de desarrollo:**
    ```bash
    ./bin/dev
    ```
    *(Nota: Usamos `./bin/dev` para compilar Tailwind y JS en tiempo real).*

5.  **Accede a:** `http://localhost:3000`

---

## 👨‍💻 Autor

**José Javier Gavilán Hidalgo**
Ingeniero de Software enfocado en soluciones Full Stack y arquitectura escalable.

---