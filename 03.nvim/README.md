# Neovim Configuration — URICKVAN

Personal Neovim configuration built on **NvChad v2.5**, extended for backend,
DevOps, and fullstack development workflows.

Optimized for: Python / Django · TypeScript / Node · SQL · Bash · Docker · Git

---

## Base

Built on top of [NvChad v2.5](https://github.com/NvChad/NvChad).
Extends it — does not replace it.

NvChad provides out of the box (not re-declared here):
nvim-treesitter, telescope.nvim, nvim-tree.lua, gitsigns.nvim,
nvim-autopairs, indent-blankline.nvim, which-key.nvim, base LSP config,
default mappings / options / autocmds.

---

## Project Structure

```
03.nvim/
├── init.lua                  ← Bootstrap: Lazy.nvim + NvChad + custom plugins
├── lazy-lock.json            ← Exact plugin commit pins
├── docs/
│   ├── mappings.md           ← Full keymap reference (by hand, by modifier)
│   └── NEOVIM_CONTEXT.md     ← AI-assisted dev context doc
└── lua/
    ├── chadrc.lua            ← NvChad theme/UI (onedark, transparency)
    ├── options.lua           ← Editor options (extends NvChad defaults)
    ├── mappings.lua          ← Keymaps (extends NvChad defaults)
    ├── autocmds.lua          ← Auto-commands
    ├── configs/
    │   ├── lazy.lua          ← Lazy.nvim settings
    │   ├── lspconfig.lua     ← LSP server setup
    │   └── conform.lua       ← Formatter configuration
    └── plugins/
        └── init.lua          ← All custom plugin declarations
```

---

## Custom Plugins

### LSP & Formatting

| Plugin | Role |
|--------|------|
| `nvim-lspconfig` | LSP client configuration |
| `mason.nvim` | LSP / formatter / linter installer |
| `mason-lspconfig.nvim` | Bridges Mason packages to lspconfig |
| `conform.nvim` | Multi-language formatter (format on save) |

LSP servers (auto-installed via Mason):
`pyright` · `ts_ls` · `html` · `cssls` · `lua_ls`

Formatters (install via `:MasonInstall`):
`prettier` · `black` · `stylua` · `shfmt`

### Autocompletion

| Plugin | Role |
|--------|------|
| `nvim-cmp` | Completion engine (LSP + LuaSnip + buffer + path) |
| `LuaSnip` v2 | Snippet engine |
| `friendly-snippets` | VSCode-style snippet collection |

### Web Development

| Plugin | Role |
|--------|------|
| `nvim-ts-autotag` | HTML / JSX / TSX tag auto-close and rename |
| `nvim-surround` | Surround text with delimiters |
| `emmet-vim` | Emmet expansion (`<C-Z>,`) in html / css / jsx / tsx |

### Terminal

| Plugin | Role |
|--------|------|
| `toggleterm.nvim` | Float / vertical / horizontal terminals; Live Server integration |

### Productivity

| Plugin | Role |
|--------|------|
| `auto-session` | Auto save/restore sessions; Telescope picker via `<leader>fs` |
| `render-markdown.nvim` | In-buffer Markdown rendering (headings, tables, code blocks) |

---

## Keymaps

Full reference: [`docs/mappings.md`](docs/mappings.md)

Organized by hand (Corne keyboard layout) and modifier. Sources annotated as
**P** personal · **N** NvChad · **V** Vim native.

`<leader>` = `Space`

### Window navigation (normal mode)

| Key | Action |
|-----|--------|
| `<C-h>` | Focus window left |
| `<C-n>` | Focus window right |
| `<C-c>` | Focus window up |
| `<C-t>` | Focus window down |

### Key personal mappings

| Key | Mode | Action |
|-----|------|--------|
| `<leader>n` | n | Toggle NvimTree |
| `<leader>ff` | n | Find files (Telescope) |
| `<leader>fg` | n | Live grep (Telescope) |
| `<leader>fs` | n | Find/restore sessions |
| `<leader>tt` | n | Float terminal |
| `<leader>ls` | n | Toggle Live Server |
| `<C-s>` | n/i/v | Save file |
| `;` | n | Enter command mode |
| `jk` | i | Exit insert mode |

---

## Installation

### 1. Clone

```bash
git clone https://github.com/URICKVAN/00.config.git ~/dotfiles
```

### 2. Symlink

```bash
ln -s ~/dotfiles/03.nvim ~/.config/nvim
```

### 3. Launch Neovim

```bash
nvim
```

Lazy.nvim bootstraps itself, installs NvChad and all plugins automatically.
Run `:MasonInstall prettier black stylua shfmt` after first launch.

---

## Requirements

| Dependency | Version | Notes |
|------------|---------|-------|
| Neovim | >= 0.10 | |
| Git | any | Lazy.nvim bootstrap |
| Node.js | >= 18 LTS | ts_ls, html-lsp, cssls |
| Python 3 | >= 3.8 | pyright |
| make / gcc | system | LuaSnip jsregexp build |
| Nerd Font | any | Icons in UI |
| ripgrep (`rg`) | any | Telescope live_grep |
| fd | any | Telescope find_files |

### External (not Mason-managed)

```bash
npm install -g live-server
```

---

## Editor Configuration

- Theme: `onedark` with terminal transparency
- Indentation: 2 spaces
- Line numbers: absolute + relative
- Scroll margins: 8 lines vertical / horizontal
- Clipboard: system (`unnamedplus`)
- Splits: vertical opens right, horizontal opens below
- Format on save: via `conform.nvim`

---

## Author

Jorge Emmanuel Godínez Rojas — URICKVAN
