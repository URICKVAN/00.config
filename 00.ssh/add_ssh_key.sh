#!/bin/bash
# ============================================
# Alta de nueva clave SSH pegando claves manualmente
# Crea carpeta, actualiza config, carga al agente y opcionalmente agrega al servidor
# ============================================

BASE_DIR="/Users/iurickvan/Documents/00.config/00.ssh"
CONFIG_FILE="$BASE_DIR/config"

echo "=== ALTA DE NUEVA CLAVE SSH (PEGANDO CLAVES) ==="
read -p "Nombre de la llave (sin espacios): " KEY_NAME

# Validar nombre
if [[ -z "$KEY_NAME" ]]; then
  echo "❌ Error: El nombre de la llave no puede estar vacío."
  exit 1
fi

KEY_DIR="$BASE_DIR/$KEY_NAME"
PRIV_KEY="$KEY_DIR/${KEY_NAME}_ed25519"
PUB_KEY="$KEY_DIR/${KEY_NAME}_ed25519.pub"

# Validar existencia previa
if [[ -d "$KEY_DIR" ]]; then
  echo "❌ Error: Ya existe una carpeta para '$KEY_NAME'."
  exit 1
fi

read -p "Host (alias): " HOST_ALIAS
read -p "HostName (IP o dominio): " HOST_NAME
read -p "User: " USER_NAME
read -p "Port: " PORT_NUM

if [[ -z "$HOST_ALIAS" || -z "$HOST_NAME" || -z "$USER_NAME" || -z "$PORT_NUM" ]]; then
  echo "❌ Error: Todos los campos son obligatorios."
  exit 1
fi

# Validar alias en config
if [[ -f "$CONFIG_FILE" ]]; then
  if grep -q "Host $HOST_ALIAS" "$CONFIG_FILE"; then
    echo "❌ Error: El alias '$HOST_ALIAS' ya existe en el archivo config."
    exit 1
  fi
fi

# Crear carpeta
mkdir -p "$KEY_DIR"

# Captura de clave privada
echo ""
echo "👉 Pega la clave PRIVADA ahora (finaliza con Ctrl+D en una línea nueva):"
cat > "$PRIV_KEY"
if [[ ! -s "$PRIV_KEY" ]]; then
  echo "❌ Error: No se recibió contenido para la clave privada."
  rm -rf "$KEY_DIR"
  exit 1
fi

# Captura de clave pública
echo ""
echo "👉 Pega la clave PÚBLICA ahora (finaliza con Ctrl+D en una línea nueva):"
cat > "$PUB_KEY"
if [[ ! -s "$PUB_KEY" ]]; then
  echo "❌ Error: No se recibió contenido para la clave pública."
  rm -rf "$KEY_DIR"
  exit 1
fi

# Permisos seguros
chmod 700 "$KEY_DIR"
chmod 600 "$PRIV_KEY"
chmod 600 "$PUB_KEY"

# Agregar al config
{
  echo ""
  echo "# === $KEY_NAME ==="
  echo "Host $HOST_ALIAS"
  echo "    HostName $HOST_NAME"
  echo "    User $USER_NAME"
  echo "    Port $PORT_NUM"
  echo "    IdentityFile $PRIV_KEY"
} >> "$CONFIG_FILE"

chmod 600 "$CONFIG_FILE"

echo ""
echo "✅ Llave '$KEY_NAME' registrada correctamente."
echo "📌 Para conectarte usa: ssh $HOST_ALIAS"

# Cargar automáticamente al agente
echo ""
echo "🔑 Cargando la nueva clave al ssh-agent..."
eval "$(ssh-agent -s)"
ssh-add "$PRIV_KEY"
if [[ $? -eq 0 ]]; then
  echo "✅ Clave privada cargada correctamente al agente."
else
  echo "⚠️  Hubo un problema cargando la clave al agente. Puedes hacerlo manualmente:"
  echo "ssh-add $PRIV_KEY"
fi

# Preguntar si se desea agregar al servidor
read -p "¿Quieres agregar la clave al servidor ahora? (s/n): " ADD_SERVER
if [[ "$ADD_SERVER" == "s" || "$ADD_SERVER" == "S" ]]; then
  if ! command -v ssh-copy-id &> /dev/null; then
    echo "❌ El comando ssh-copy-id no está instalado. Instálalo con:"
    echo "brew install ssh-copy-id"
    exit 1
  fi

  echo "🔑 Agregando clave pública al servidor..."
  if [[ "$PORT_NUM" == "22" ]]; then
    ssh-copy-id -i "$PUB_KEY" "$USER_NAME@$HOST_NAME"
  else
    ssh-copy-id -i "$PUB_KEY" -p "$PORT_NUM" "$USER_NAME@$HOST_NAME"
  fi
  echo "✅ Clave pública agregada al servidor (si no hubo errores)."
fi
