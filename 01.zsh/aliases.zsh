# ======================================================================
# ARCHIVO: aliases.zsh
# UBICACIÓN: /Users/iurickvan/Library/CloudStorage/OneDrive-Personal/00.config/aliases.zsh
# FECHA: 20250716
# AUTOR: urickvan
#
# DESCRIPCIÓN:
# Este archivo centraliza todos mis alias personalizados para la terminal.
# Lo mantengo aquí para tenerlos sincronizados y disponibles en cualquier
# equipo Mac que use. Mi archivo ~/.zshrc incluye una línea para hacer
# `source` de este archivo y así aplicar los alias automáticamente.
#
# USO:
# Cada vez que agregues un nuevo alias, documenta aquí para qué sirve.
# Esto facilita recordar su propósito y mantener el archivo ordenado.
#
# RECOMENDACIONES:
# - Usa nombres de alias cortos y fáciles de recordar.
# - Siempre deja un comentario arriba explicando qué hace y por qué existe.
# - Después de modificar este archivo, recarga la configuración con:
#       source ~/.zshrc
#
# TUTORIAL DE CONFIGURACIÓN EN UN NUEVO EQUIPO:
# 1. Asegúrate de que esta carpeta esté disponible en el equipo (OneDrive sincronizado).
# 2. Edita tu archivo de configuración de zsh:
#       nano ~/.zshrc
# 3. Agrega la siguiente línea al final del archivo:
#       if [ -f "/Users/iurickvan/Library/CloudStorage/OneDrive-Personal/00.config/aliases.zsh" ]; then
#           source "/Users/iurickvan/Library/CloudStorage/OneDrive-Personal/00.config/aliases.zsh"
#       fi
# 4. Guarda los cambios y recarga la configuración:
#       source ~/.zshrc
#
# Con esto, todos los alias definidos aquí estarán disponibles automáticamente.
# ======================================================================

# ======================================================================
# ALIAS: ls
# DESCRIPCIÓN:
# Reemplaza el comando `ls` por `ls -lG` para que, al listar archivos,
# se muestren en formato largo (con permisos, tamaño, fechas, etc.)
# y con colores para distinguir tipos de archivos.
alias ls='ls -l'
# ======================================================================
# ALIAS: ll
# DESCRIPCIÓN:
# Atajo para listar todos los archivos, incluyendo ocultos (los que
# comienzan con punto), en formato largo y con colores.
alias ll='ls -la'
# ======================================================================
# ALIAS: la
# DESCRIPCIÓN:
# Atajo para listar todos los archivos, incluyendo ocultos, pero en
# formato largo **sin colores** (útil si no quieres escape codes de color
# en algunas salidas o cuando exportas resultados).
alias la='ls -la'
# ======================================================================
# ALIAS: addkey
# DESCRIPCIÓN:
# Ejecuta el script centralizado que agrega una llave SSH al agente.
# Este script se encuentra en /Users/iurickvan/Documents/00.config/00.ssh/add_ssh_key.sh
# y puede incluir lógica para cargar llaves almacenadas en Bitwarden u otra ubicación.
alias addkey='sh /Users/iurickvan/Documents/00.config/00.ssh/add_ssh_key.sh'
