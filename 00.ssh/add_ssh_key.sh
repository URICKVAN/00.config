#!/bin/bash
# ============================================
# Alta de nueva clave SSH pegando claves manualmente
# Crea carpeta, actualiza config, carga al agente y opcionalmente agrega al servidor
# ============================================

BASE_DIR="/Users/iurickvan/Documents/00.config/00.ssh"
CONFIG_FILE="$BASE_DIR/config"

prompt_required() {
  local label="$1"
  local var
  while [[ true ]]; do
    read -p "$label" var
    if [[ -n "$var" ]]; then
      echo "$var"
      return 0
    fi
    echo "Error: Este campo es obligatorio. Intenta de nuevo"
  done
}

prompt_key_name() {
  local base_dir="$1"
  local key_name
  while [[ true ]]; do
    read -p "Nombre de la llave (sin espacios): " key_name
    if [[ -z "$key_name" ]]; then
      echo "Error: El nombre de la llave no puede estar vacio"
      continue
    fi
    if [[ "$key_name" =~ [[:space:]] ]]; then
      echo "Error: No uses espacios"
      continue
    fi
    if [[ -d "$base_dir/$key_name" ]]; then
      echo "Error: Ya existe una carpeta para '$key_name'"
      continue
    fi
    echo "$key_name"
    return 0
  done
}

prompt_host_alias_unique() {
  local config_file="$1"
  local alias
  while [[ true ]]; do
    read -p "Host (alias): " alias
    if [[ -z "$alias" ]]; then
      echo "Error: El alias es obligatorio."
      continue
    fi
    if [[ -f "$config_file" ]] && grep -qE "^[[:space:]]*Host[[:space:]]+$alias([[:space:]]+|$)" "$config_file"; then
      echo "Error: El alias '$alias' ya existe en el archivo config."
      continue
    fi
    echo "$alias"
    return 0
  done
}

capture_pasted_key() {
  local filepath="$1"
  local label="$2"
  while [[ true ]]; do
    echo ""
    echo "Pega la clave $label ahora (finaliza con Ctrl+D en una linea nueva):"
    : >"$filepath"
    cat >"$filepath"
    if [[ -s "$filepath" ]]; then
      return 0
    fi
    echo "Error: No se recibio contenido para la clave $label."
    echo "Vamos a intentar de nuevo..."
  done
}

echo "=== ALTA DE NUEVA CLAVE SSH (PEGANDO CLAVES) ==="

# DATOS BASE
KEY_NAME="$(prompt_key_name "$BASE_DIR")"

KEY_DIR="$BASE_DIR/$KEY_NAME"
PRIV_KEY="$KEY_DIR/${KEY_NAME}_ed25519"
PUB_KEY="$KEY_DIR/${KEY_NAME}_ed25519.pub"

# DATOS CONEXION
HOST_ALIAS="$(prompt_host_alias_unique "$CONFIG_FILE")"
HOST_NAME="$(prompt_required "HostName (IP o dominio): ")"
USER_NAME="$(prompt_required "User: ")"

# SOLICITAR PUERTO
while [[ true ]]; do
  PORT_NUM="$(prompt_required "Port: ")"
  if [[ "$PORT_NUM" =~ ^[0-9]+$ ]] && ((PORT_NUM >= 1 && PORT_NUM <= 65535)); then
    break
  fi
  echo "Error Port invalido (usa 1-65535)"
done

# VALIDAR CARPETA
if [[ -d "$KEY_DIR" ]]; then
  echo "❌ Error: Ya existe una carpeta para '$KEY_NAME'."
  exit 1
fi

# CREAR CARPETA
mkdir -p "$KEY_DIR"

# CREA CLAVES
capture_pasted_key "$PRIV_KEY" "PRIVADA"
capture_pasted_key "$PUB_KEY" "PUBLICA"

# PERMISOS
chmod 700 "$KEY_DIR"
chmod 600 "$PRIV_KEY"
chmod 600 "$PUB_KEY"

# AGREGAR AL CONFIG
{
  echo ""
  echo "# === $KEY_NAME ==="
  echo "Host $HOST_ALIAS"
  echo "    HostName $HOST_NAME"
  echo "    User $USER_NAME"
  echo "    Port $PORT_NUM"
  echo "    IdentityFile $PRIV_KEY"
} >>"$CONFIG_FILE"

chmod 600 "$CONFIG_FILE"

echo ""
echo "Llave '$KEY_NAME' registrada correctamente."
echo "Para conectarte usa: ssh $HOST_ALIAS"

# CARGAR AUTOMATICAMENTE AL AGENTE
echo ""
echo "Cargando la nueva clave al ssh-agent..."
eval "$(ssh-agent -s)"
ssh-add "$PRIV_KEY"
if [[ $? -eq 0 ]]; then
  echo "Clave privada cargada correctamente al agente."
else
  echo "Hubo un problema cargando la clave al agente. Puedes hacerlo manualmente:"
  echo "ssh-add $PRIV_KEY"
fi

# PREGUNTAR AGREGAR AL SERVIDOR
while [[ true ]]; do
  read -p "Quires agregar la clave al servidor ahora? (s/n): " ADD_SERVER
  case "$ADD_SERVER" in
  s | S)
    if ! command -v ssh-copy-id &>/dev/null; then
      echo "El comando ssh-copy-id no esta instalado"
      break
    fi
    echo "Agregando clave publica al servidor..."
    if [[ "$PORT_NUM" == "22" ]]; then
      ssh-copy-id -i "$PUB_KEY" "$USER_NAME@$HOST_NAME"
    else
      ssh-copy-id -i "$PUB_KEY" -p "$PORT_NUM" "$USER_NAME@$HOST_NAME"
    fi
    echo "Clave publica agregada al servidor"
    break
    ;;
  n | N)
    break
    ;;
  *)
    echo "Escribe s o n"
    ;;
  esac
done
