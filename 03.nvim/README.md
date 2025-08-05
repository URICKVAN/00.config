# 🧠 Configuración personalizada de Neovim con NvChad

Este proyecto contiene una configuración de Neovim basada en **NvChad v2.5**, personalizada para desarrollo web, scripting y productividad con soporte para múltiples lenguajes.

> 📅 Última actualización: `2025-08-05`

---

## 📦 Características principales

- 🎨 **Tema:** `onedark` con transparencia activada  
- 🧠 **LSPs** integrados: TypeScript, HTML, CSS, Python, Lua  
- 🧹 **Formateo automático:** [conform.nvim]  
- 🛠️ **Gestión de herramientas:** [mason.nvim]  
- 🏷️ **Autoetiquetado:** HTML/JSX con `nvim-ts-autotag`  
- 🔄 **Surround inteligente:** con `nvim-surround`  
- ⚡ **Expansión HTML/CSS:** con Emmet  
- 🧱 **Terminal flotante integrada:** con `toggleterm`  
- 📂 **Árbol de archivos** (`nvim-tree`) que se abre automáticamente  
- ⌨️ **Atajos optimizados:** `<leader>`, `jk`, `Tab`, `Alt+h/j/k/l`

---

## 🚀 Instalación rápida

```bash
git clone https://github.com/tu-usuario/tu-repo ~/.config/nvim
bash ~/.config/nvim/bootstrap.sh
nvim
```

---

## 🛠️ Requisitos

Instala los siguientes binarios globales:

```bash
npm install -g prettier        # HTML, JS, TS, CSS, JSON
pip install black              # Python
cargo install stylua           # Lua
sudo apt install shfmt         # Shell (o usa brew en macOS)
```

---

## 📁 Estructura de archivos destacada

```bash
.config/nvim/
├── init.lua                      # Archivo de arranque
├── .stylua.toml                  # Configuración del formateador Lua
├── lua/
│   ├── chadrc.lua                # Configuración de apariencia y opciones generales
│   ├── options.lua               # Opciones de Neovim
│   ├── mappings.lua              # Atajos personalizados
│   ├── autocmds.lua              # Autocomandos
│   ├── configs/
│   │   ├── conform.lua           # Configuración de conform.nvim (formateo)
│   │   ├── lazy.lua              # Configuración de lazy.nvim
│   │   └── lspconfig.lua         # Configuración de LSPs
│   └── plugins/
│       └── init.lua              # Declaración de plugins externos
├── lazy-lock.json                # Archivo autogenerado de bloqueo de plugins
```

---

## 🧩 Atajos útiles

| Acción                      | Comando                  |
|----------------------------|--------------------------|
| Abrir terminal flotante    | `<leader>tt`             |
| Guardar archivo            | `<Ctrl+s>` (si definido) |
| Salir del modo insert      | `jk`                     |
| Mover entre buffers        | `<Tab>` y `<S-Tab>`      |
| Mover entre ventanas       | `<Alt+h/j/k/l>`          |
| Abrir árbol de archivos    | `nvim .` (abre NvimTree) |

---

## 🔧 Formateo automático

El formateo se activa en:

- `BufWritePre` (al guardar)
- `InsertLeave` (al salir del modo Insert)

Aplica para archivos:

```
.js, .jsx, .ts, .tsx, .html, .css, .json, .py, .sh, .lua
```

Manual:

```vim
:ConformFormat
```

---

## 🧪 Comandos útiles

```vim
:Mason             " Abre la interfaz de mason
:MasonInstall tsserver html cssls lua_ls pyright
:ToggleTerm        " Abre la terminal flotante
:NvimTreeToggle    " Abre o cierra el árbol de archivos
:ConformInfo       " Información sobre formateadores disponibles
```

---

## 📐 Opcional: Uso de `.editorconfig`

Puedes agregar un archivo `.editorconfig` para mantener consistencia entre editores.

### 📄 Ejemplo de `.editorconfig`

```ini
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
indent_style = space
indent_size = 2

[*.py]
indent_size = 4

[*.md]
trim_trailing_whitespace = false

[Makefile]
indent_style = tab
```

👉 [Descargar .editorconfig](sandbox:/mnt/data/.editorconfig)
