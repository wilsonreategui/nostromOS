# 🚀 nostromOS

Mi propio sistema operativo inmutable basado en **Fedora Kinoite + Nvidia**, construido automáticamente usando BlueBuild.

## 🗺️ Arquitectura y Carpetas

El sistema se construye en la nube de manera automática y atómica.
A --> 📦 Imagen Base (kinoite-nvidia) 
B --> 🛠️ recipes/recipe.yml
C --> ⚙️ .github/ (Actions)
D --> 🌐 ghcr.io/wilsonreategui/nostromos
E --> 💻 Tu Computadora


### ¿Para qué sirve cada carpeta?

- **`recipes/`**: Contiene `recipe.yml`, el "plano arquitectónico" de nostromOS. Aquí defines la imagen base y qué paquetes/flatpaks instalar o eliminar.
- **`files/`**: Permite inyectar archivos al sistema. Lo que pongas dentro de `files/system/` se copiará directamente a la raíz `/` de tu PC.
- **`modules/`**: Espacio para scripts avanzados si la configuración estándar de BlueBuild no es suficiente.
- **`.github/`**: La fábrica en la nube. Contiene el flujo (`build.yml`) que lee tu receta y compila el OS automáticamente cada vez que guardas cambios, subiéndolo a GitHub Container Registry.
