# ⚙️ Configuración personalizada de Neovim con NvChad

Repositorio de configuración para [NvChad](https://github.com/NvChad/NvChad), mantenido y versionado por [URICKVAN](https://github.com/URICKVAN) dentro del repositorio:  
🔗 https://github.com/URICKVAN/00.config.git

---

## 📁 Estructura y ubicación

La configuración está ubicada en:

```
~/Documents/00.config/03.nvim
```

Y se vincula con el directorio estándar de configuración de Neovim usando un **enlace simbólico**:

```bash
rm -rf ~/.config/nvim  # Elimina si ya existía
ln -s ~/Documents/00.config/03.nvim ~/.config/nvim
```

Esto permite mantener la configuración centralizada, versionada y replicable en otros entornos.

---

## 🚀 Instalación rápida

1. Clona el repositorio:
   ```bash
   git clone https://github.com/URICKVAN/00.config.git ~/Documents/00.config
   ```

2. Crea el enlace simbólico:
   ```bash
   ln -s ~/Documents/00.config/03.nvim ~/.config/nvim
   ```

3. Inicia Neovim (la primera vez instalará los plugins):
   ```bash
   nvim
   ```

---

## 📦 Plugins destacados

- `nvim-lspconfig` – soporte LSP para múltiples lenguajes
- `mason.nvim` + `mason-lspconfig` – gestión de servidores LSP y herramientas
- `conform.nvim` – formateo automático al guardar y al salir de modo Insert
- `nvim-ts-autotag` – cierre automático de etiquetas
- `toggleterm.nvim` – terminal flotante
- `nvim-surround` – manipulación de pares de símbolos
- `emmet-vim` – expansión rápida de etiquetas HTML

---

## 🧠 Atajos útiles

| Comando               | Acción                                        |
|-----------------------|-----------------------------------------------|
| `<leader>tt`          | Abre terminal flotante (ToggleTerm)          |
| `<Tab>` / `<S-Tab>`   | Navegar entre buffers                         |
| `:NvimTreeToggle`     | Abrir/cerrar el explorador de archivos        |
| `:Format`             | Ejecutar formateo manual con conform.nvim     |
| `jk` en modo Insert   | Salir al modo Normal                          |
| `;` en modo Normal    | Entra en modo comando (`:`)                   |

---

## 🧼 Formateo automático

Está configurado para ejecutarse en los siguientes eventos:

- Al **salir del modo Insert**
- Al **guardar el archivo**

### Archivos soportados:

- `.js`, `.jsx`, `.ts`, `.tsx`, `.html`, `.css`, `.json`, `.py`, `.sh`, `.lua`

---

## 🔧 Dependencias sugeridas

Instala Prettier, Black, shfmt, stylua, etc., por ejemplo:

```bash
npm install -g prettier
pip install black
brew install shfmt stylua
```

---

## 📝 Licencia

MIT © URICKVAN