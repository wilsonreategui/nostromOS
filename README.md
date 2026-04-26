# 🚀 nostromOS

Mi propio sistema operativo inmutable basado en **Fedora Kinoite + Nvidia**, construido automáticamente usando BlueBuild.

## 🗺️ Arquitectura y Carpetas

El sistema se construye en la nube de manera automática y atómica.

```mermaid
flowchart TD
    A[📦 Imagen Base\n(kinoite-nvidia)] --> B(🛠️ recipes/recipe.yml)
    B --> C{⚙️ .github/ (Actions)}
    C --> D[🌐 ghcr.io/wilsonreategui/nostromos]
    D --> E[💻 Tu Computadora]
    
    style A fill:#0B5A81,stroke:#333,stroke-width:2px,color:#fff
    style B fill:#1F2937,stroke:#333,stroke-width:2px,color:#fff
    style C fill:#238636,stroke:#333,stroke-width:2px,color:#fff
    style D fill:#1F883D,stroke:#333,stroke-width:2px,color:#fff
    style E fill:#6366F1,stroke:#333,stroke-width:2px,color:#fff
``` 

### ¿Para qué sirve cada carpeta?

- **`recipes/`**: Contiene `recipe.yml`, el "plano arquitectónico" de nostromOS. Aquí defines la imagen base y qué paquetes/flatpaks instalar o eliminar.
- **`files/`**: Permite inyectar archivos al sistema. Lo que pongas dentro de `files/system/` se copiará directamente a la raíz `/` de tu PC.
- **`modules/`**: Espacio para scripts avanzados si la configuración estándar de BlueBuild no es suficiente.
- **`.github/`**: La fábrica en la nube. Contiene el flujo (`build.yml`) que lee tu receta y compila el OS automáticamente cada vez que guardas cambios, subiéndolo a GitHub Container Registry.

---

## 💿 Instalación desde ISO

Para instalar nostromOS desde cero en tu computadora, la mejor manera es generar una imagen ISO que puedas flashear en un USB. 

Una vez que tu código se haya subido a GitHub y la imagen termine de construirse en la pestaña "Actions", puedes generar la ISO fácilmente usando la herramienta de BlueBuild desde otra terminal de Linux:

1. **Instala BlueBuild CLI** (si no lo tienes):
   Puedes revisar la [documentación oficial](https://blue-build.org/cli/) para obtener el instalador.

2. **Genera la ISO basada en tu imagen de la nube**:
   Ejecuta este comando para descargar tu imagen recién creada en GitHub y empaquetarla en un archivo ISO listo para usar:
   ```bash
   sudo bluebuild generate-iso --iso-name nostromOS.iso image ghcr.io/wilsonreategui/nostromos
   ```

3. **Flashea el USB**:
   Usa programas como **Fedora Media Writer**, **Rufus** (en Windows) o **BalenaEtcher** para grabar el archivo `nostromOS.iso` en tu memoria USB.

4. **Instala el sistema**:
   Inicia tu PC desde el USB y sigue el instalador gráfico estándar de Fedora. ¡Al terminar, tu PC tendrá nostromOS puro!