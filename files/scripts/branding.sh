#!/usr/bin/env bash
set -oue pipefail

echo "Configurando branding de NostromOS..."

# Rutas de logos en el sistema instalado
cp /usr/share/pixmaps/nostromos-logo.png /usr/share/pixmaps/fedora-logo.png
cp /usr/share/pixmaps/nostromos-logo.png /usr/share/pixmaps/fedora-logo-sprite.png
cp /usr/share/pixmaps/nostromos-logo.png /usr/share/pixmaps/system-logo-white.png

# Rutas de logos para el instalador Anaconda (si se ejecuta desde el runtime de la imagen)
mkdir -p /usr/share/anaconda/pixmaps
cp /usr/share/pixmaps/nostromos-logo.png /usr/share/anaconda/pixmaps/sidebar-logo.png
cp /usr/share/pixmaps/nostromos-logo.png /usr/share/anaconda/pixmaps/topbar-logo.png
cp /usr/share/pixmaps/nostromos-logo.png /usr/share/anaconda/pixmaps/fedora-logo.png
cp /usr/share/pixmaps/nostromos-logo.png /usr/share/anaconda/pixmaps/fedora-server-logo.png

# Opcional: Cambiar el fondo del instalador si lo deseas
# cp /path/to/your/bg.png /usr/share/anaconda/pixmaps/sidebar-bg.png
