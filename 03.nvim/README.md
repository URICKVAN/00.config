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

    03.nvim/
    ├── init.lua
    ├── lua/
    │   ├── core/
    │   │   ├── options.lua
    │   │   ├── keymaps.lua
    │   │   └── autocmds.lua
    │   ├── plugins/
    │   │   ├── lsp.lua
    │   │   ├── treesitter.lua
    │   │   ├── telescope.lua
    │   │   ├── completion.lua
    │   │   └── ...
    │   └── utils/
    └── README.md

### Structure Overview

-   `core/` → Base configuration (options, mappings, autocmds)
-   `plugins/` → Individual plugin configurations
-   `utils/` → Reusable helper functions

------------------------------------------------------------------------

## 🧩 Core Plugins

### LSP & Autocompletion

-   nvim-lspconfig
-   mason.nvim
-   nvim-cmp
-   LuaSnip

### Search & Navigation

-   telescope.nvim
-   plenary.nvim

### Syntax & Parsing

-   nvim-treesitter

### Git Integration

-   gitsigns.nvim

### UI & Developer Experience

-   Minimal statusline
-   Clean theme
-   Non-intrusive diagnostics

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

-   Neovim ≥ 0.9
-   Git
-   Node.js (for certain LSP servers)
-   Python 3
-   Nerd Font installed

------------------------------------------------------------------------

## 👨‍💻 Author

Jorge Emmanuel Godínez Rojas