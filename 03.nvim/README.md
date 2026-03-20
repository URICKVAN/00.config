# 🧠 Neovim Configuration -- URICKVAN

Personal **Neovim configuration** focused on backend development, DevOps
workflows, and real-world production environments.

This setup is optimized for:

-   Python / Django
-   SQL
-   Bash scripting
-   Docker
-   Git workflows
-   Linux infrastructure
-   Fullstack backend projects

------------------------------------------------------------------------

## 🚀 Philosophy

This configuration follows these principles:

-   ⚡ Fast startup
-   🧩 Modular architecture
-   🔎 Strong LSP integration
-   🐍 Python-first workflow
-   🐳 DevOps-ready
-   🎯 Productivity over aesthetics

The goal is to build software efficiently, not just customize an editor.

------------------------------------------------------------------------

## 🏗️ Project Structure

Built on **NvChad v2.5** — extends it, does not replace it.

    03.nvim/
    ├── init.lua                  ← Bootstrap: Lazy.nvim + NvChad + custom plugins
    ├── lazy-lock.json            ← Exact plugin commit pins
    ├── README.md
    ├── docs/
    │   └── NEOVIM_CONTEXT.md    ← AI-assisted dev context doc
    └── lua/
        ├── chadrc.lua            ← NvChad theme/UI config (onedark, transparency)
        ├── options.lua           ← Editor options (extends NvChad defaults)
        ├── mappings.lua          ← Keymaps (extends NvChad defaults)
        ├── autocmds.lua          ← Auto-commands
        ├── configs/
        │   ├── lazy.lua          ← Lazy.nvim settings
        │   ├── lspconfig.lua     ← LSP server setup
        │   └── conform.lua       ← Formatter configuration
        └── plugins/
            └── init.lua          ← All custom plugin declarations

### What NvChad provides (not re-declared here)

nvim-treesitter, telescope.nvim, nvim-tree.lua, gitsigns.nvim,
nvim-autopairs, indent-blankline.nvim, which-key.nvim, default LSP base,
default mappings/options/autocmds.

------------------------------------------------------------------------

## 🧩 Custom Plugins

### LSP & Formatting

-   nvim-lspconfig + mason.nvim + mason-lspconfig
-   conform.nvim (prettier, black, stylua, shfmt)
-   Servers: pyright, ts_ls, html, cssls, lua_ls

### Autocompletion

-   nvim-cmp (LSP + LuaSnip + buffer + path sources)
-   LuaSnip v2 + friendly-snippets (VSCode snippets)

### Web Development

-   nvim-ts-autotag (HTML/JSX/TSX tag auto-close)
-   nvim-surround
-   emmet-vim (`<C-Z>,` in html/css/jsx/tsx)

### Terminal

-   toggleterm.nvim (float/vertical/horizontal; Live Server integration)

### Sessions

-   auto-session (auto save/restore; Telescope picker `<leader>fs`)

------------------------------------------------------------------------

## 🐍 Python / Django Workflow

Optimized for:

-   Python LSP support
-   Automatic formatting
-   Real-time diagnostics
-   Snippets for faster development
-   Django-based backend systems
-   ETL pipelines
-   PostgreSQL integration

Designed to work seamlessly with:

-   Dockerized environments
-   Cron jobs
-   Batch processing scripts
-   Production deployment workflows

------------------------------------------------------------------------

## 🐳 DevOps Workflow

This configuration supports:

-   Dockerfiles
-   docker-compose.yml
-   YAML for CI/CD
-   Bash scripting
-   SSH workflows
-   Linux server configuration
-   Infrastructure management

------------------------------------------------------------------------

## ⚙️ Installation

### 1️⃣ Clone the repository

git clone https://github.com/URICKVAN/00.config.git

### 2️⃣ Create symbolic link

ln -s \~/path/to/00.config/03.nvim \~/.config/nvim

### 3️⃣ Launch Neovim

nvim

Plugins will install automatically (depending on the configured plugin
manager).

------------------------------------------------------------------------

## 🧪 Real-World Usage

This setup is used for:

-   Backend system development (Django + PostgreSQL)
-   Python ETL pipelines
-   Bash automation scripts
-   Linux server maintenance
-   LIS integrations
-   Git version control workflows
-   Infrastructure configuration (Proxmox / NAS / Docker)

------------------------------------------------------------------------

## 📌 Requirements

-   Neovim ≥ 0.9 (recommend ≥ 0.10)
-   Git
-   Node.js ≥ 18 LTS + npm (ts_ls, html-lsp, cssls; live-server)
-   Python 3 ≥ 3.8 (pyright)
-   make / gcc (LuaSnip jsregexp build)
-   Nerd Font
-   ripgrep (`rg`) and fd (Telescope)

### Mason-managed (auto-installed)

LSP: `typescript-language-server`, `html-lsp`, `css-lsp`, `pyright`, `lua-language-server`

Formatters (install manually via `:MasonInstall`):
`prettier`, `black`, `stylua`, `shfmt`

### External

```
npm install -g live-server
```

------------------------------------------------------------------------

## 👨‍💻 Author

Jorge Emmanuel Godínez Rojas