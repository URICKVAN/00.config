#!/bin/zsh
echo "🔎 Verificando entorno Zsh y Homebrew…"

# Verificar si se carga correctamente ~/.zshrc
if [ -f "$HOME/.zshrc" ]; then
  echo "✅ Archivo ~/.zshrc encontrado (enlace simbólico o archivo real)."
else
  echo "❌ No se encontró ~/.zshrc, revisa el enlace simbólico."
fi

# Mostrar ruta actual de la shell
echo "💡 Shell actual: $SHELL"

# Verificar si PATH contiene /opt/homebrew/bin
if [[ ":$PATH:" == *":/opt/homebrew/bin:"* ]]; then
  echo "✅ PATH contiene /opt/homebrew/bin"
else
  echo "❌ PATH no contiene /opt/homebrew/bin"
fi

# Verificar nvim
if command -v nvim >/dev/null 2>&1; then
  echo "✅ nvim está disponible en: $(which nvim)"
  nvim_version=$(nvim --version | head -n 1)
  echo "   ↳ Versión: $nvim_version"
else
  echo "❌ nvim no está disponible. Instálalo con: brew install neovim"
fi

# Verificar carpeta de sesiones
if [ -d "$HOME/.zsh_sessions" ]; then
  echo "✅ Carpeta de sesiones existe: $HOME/.zsh_sessions"
else
  echo "❌ Carpeta de sesiones no existe. Creándola…"
  mkdir -p "$HOME/.zsh_sessions" && echo "   ✅ Carpeta creada."
fi

echo "✅ Verificación completada."
