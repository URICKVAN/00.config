# NEOVIM_CONTEXT.md

Persistent context document for AI-assisted development of this Neovim configuration.
Last updated: 2026-04-09.

---

## Overview

This is a personal Neovim configuration owned by Jorge Emmanuel Godínez Rojas (URICKVAN),
built on top of **NvChad v2.5** and extended progressively for backend, DevOps,
and fullstack development workflows.

The configuration is part of a larger dotfiles monorepo (`00.config`), where this
directory (`03.nvim`) is symlinked to `~/.config/nvim`.

---

## Origin — NvChad-Based

This configuration is **not built from scratch**. It is derived from:

- **NvChad v2.5** — `https://github.com/NvChad/NvChad` (branch `v2.5`)
- **Plugin manager**: Lazy.nvim (auto-bootstrapped from GitHub)
- **Theme engine**: base46 (NvChad's custom theme system)
- **UI layer**: NvChad UI v3.0

NvChad provides the following out of the box (not re-declared in this repo unless extended):
- nvim-treesitter
- telescope.nvim + plenary.nvim
- nvim-tree.lua
- gitsigns.nvim
- nvim-autopairs
- indent-blankline.nvim
- which-key.nvim
- Default LSP configuration base
- Default mappings, options, autocmds

The rule is: **extend NvChad, don't fight it**. If NvChad provides something,
build on top of it using the override patterns it exposes (e.g., `require "nvchad.options"`
before custom options, `require "nvchad.mappings"` before custom mappings).

---

## Goals

### Primary Goals
1. **Portability** — Clone and run on any machine (macOS, Linux) with minimal manual steps.
2. **Reproducibility** — Every plugin pinned via `lazy-lock.json`; LSPs and formatters
   managed by Mason.
3. **Productivity** — Fast startup, strong LSP, formatters on save, terminal integration.

### Secondary Goals
- Stay compatible with NvChad conventions to ease upgrades.
- Keep configuration modular and readable.
- Avoid bloat — each plugin must earn its place.

---

## Repository Structure

```
03.nvim/
├── init.lua                  ← Bootstrap entry point
├── lazy-lock.json            ← Exact plugin commit pins
├── README.md                 ← User-facing install guide (needs update)
├── docs/
│   └── NEOVIM_CONTEXT.md    ← This file
└── lua/
    ├── chadrc.lua            ← NvChad theme/UI config (onedark, transparency)
    ├── options.lua           ← Editor options (extends NvChad defaults)
    ├── mappings.lua          ← Keymaps (extends NvChad defaults)
    ├── autocmds.lua          ← Auto-commands (format triggers, NvimTree open)
    ├── configs/
    │   ├── lazy.lua          ← Lazy.nvim configuration
    │   ├── lspconfig.lua     ← LSP server setup
    │   └── conform.lua       ← Formatter configuration
    └── plugins/
        └── init.lua          ← All custom plugin declarations
```

---

## Load Sequence

```
nvim launches
  └── init.lua
        ├── vim.g.base46_cache  (theme cache path)
        ├── vim.g.mapleader = " "
        ├── Bootstrap Lazy.nvim (clone if missing)
        ├── lazy.setup()
        │     ├── NvChad/NvChad v2.5  → imports nvchad.plugins
        │     └── plugins/init.lua    → custom plugins
        ├── dofile(base46 cache: defaults + statusline)
        ├── require "options"
        ├── require "autocmds"
        └── vim.schedule → require "mappings"
```

---

## Customizations Made

### Theme (`chadrc.lua`)
- Theme: `onedark`
- Transparency: enabled (terminal background shows through)
- Highlight overrides: `Comment` and `@comment` rendered in italic

### Options (`options.lua`)
Extends `nvchad.options` with:
- Absolute + relative line numbers
- Cursorline (full line + number)
- 8-line vertical/horizontal scroll margins
- 2-space indentation (spaces, not tabs)
- Case-insensitive search with smartcase
- System clipboard integration (`unnamedplus`)
- Splits: vertical opens right, horizontal opens below
- `wrap = false`
- Folding: `foldlevel = 99`, `foldlevelstart = 99`, `foldenable = true` (required for nvim-ufo)

### Keymaps (`mappings.lua`)
Extends `nvchad.mappings` with:
- `;` → `:` (command mode without Shift)
- `jk` → `<ESC>` (exit insert mode)
- `<C-s>` → save file (all modes)
- `<leader>ff` → Telescope find_files
- `<leader>fg` → Telescope live_grep
- `<leader>fs` → AutoSession search (session picker via Telescope)
- `<leader>db` → DBUIToggle
- `<leader>da` → DBUIAddConnection
- `<leader>df` → DBUIFindBuffer
- `<leader>j` → TSJToggle (split/join node)
- `zR` → `ufo.openAllFolds()`
- `zM` → `ufo.closeAllFolds()`

### Auto-commands (`autocmds.lua`)
- `InsertLeave` → auto-format file via conform (aggressive)
- `BufWritePre` → auto-format file via conform (duplicates conform's format_on_save)
- `VimEnter` → open NvimTree automatically

### Plugins (`plugins/init.lua`)

| Plugin | Key Config |
|---|---|
| `nvim-lspconfig` | Delegates to `configs/lspconfig.lua` |
| `mason.nvim` | `:MasonUpdate` on install |
| `mason-lspconfig.nvim` | ensure_installed: tsserver, html, cssls, pyright, lua_ls, jsonls |
| `conform.nvim` | Delegates to `configs/conform.lua`; format_on_save enabled |
| `toggleterm.nvim` | Float/vertical/horizontal terminals; Live Server integration |
| `nvim-ts-autotag` | HTML/JSX/TSX tag auto-close/rename |
| `nvim-surround` | Surround text with delimiters |
| `emmet-vim` | Emmet expand: `<C-Z>,` in html/css/jsx/tsx/vue/svelte |
| `LuaSnip` v2 | VSCode snippets via friendly-snippets; jsregexp build step |
| `nvim-cmp` | Completion: LSP + LuaSnip + buffer + path sources; dadbod source active on sql/mysql/plsql ft |
| `nvim-web-devicons` | File type icons |
| `nvim-tree.lua` | Override: `filters.git_ignored = false` (shows .env and other git-ignored files) |
| `render-markdown.nvim` | In-buffer Markdown rendering (headings, tables, code blocks, checkboxes, links); active on `ft=markdown` |
| `auto-session` | Automatic session save/restore; NvimTree closed before save, reopened after restore; Telescope picker via `<leader>fs` |
| `schemastore.nvim` | Provides JSON Schema Store catalog for jsonls |
| `nvim-ufo` | Modern folding with treesitter provider and fold preview on hover |
| `treesj` | Split/join nodes between single-line and multi-line (`<leader>j`) |
| `vim-dadbod` | Database interface core (PostgreSQL, MySQL, SQLite, Redis…) |
| `vim-dadbod-ui` | DBUI panel; connections saved in `~/.local/share/db_ui/`; supports `$ENV_VAR` URLs |
| `vim-dadbod-completion` | SQL completion source for nvim-cmp; active on sql/mysql/plsql filetypes |

### LSP Servers (`configs/lspconfig.lua`)
Uses `vim.lsp.config` / `vim.lsp.enable` API (Neovim 0.11+). Extends `nvchad.configs.lspconfig.defaults()`.

| Server | Language | Notes |
|---|---|---|
| `html` | HTML | No custom config |
| `cssls` | CSS | No custom config |
| `ts_ls` | TypeScript / JavaScript | No custom config |
| `pyright` | Python | No custom config |
| `lua_ls` | Lua | `globals = {"vim"}` to suppress nvim API warnings |
| `jsonls` | JSON | Schema validation via `schemastore.nvim`; auto-detects schemas for package.json, tsconfig.json, etc. |

### Formatters (`configs/conform.lua`)

| Language | Formatter |
|---|---|
| JS / JSX / TS / TSX | prettier |
| HTML / CSS / JSON | prettier |
| Lua | stylua |
| Python | black |
| Shell | shfmt |

---

## Known Issues (Do Not Introduce Workarounds Without Fixing Root Cause)

### 1. Double formatting on save
`autocmds.lua` defines a `BufWritePre` autocmd that calls `conform.format()`,
AND `conform.lua` has `format_on_save` enabled. Formatting runs twice on every
save. The `InsertLeave` autocmd also formats on every Esc press — very aggressive.

**Fix needed:** Remove the BufWritePre/InsertLeave autocmds from `autocmds.lua`
and rely solely on `format_on_save` in `conform.lua`.

### 2. `tsserver` / `ts_ls` name mismatch
`mason-lspconfig.ensure_installed` uses `"tsserver"` (deprecated name).
`lspconfig.lua` configures `"ts_ls"` (current name). These must match.
In newer mason-lspconfig, use `"ts_ls"` in both places.

### ~~3. Broken Mason auto-install loop in `lspconfig.lua`~~ ✅ Fixed
The broken `mason_registry` loop was removed. Installation handled solely by
`mason-lspconfig.ensure_installed`.

### 4. macOS-specific `open` command
`vim.fn.jobstart({ "open", "http://127.0.0.1:5500" })` in `plugins/init.lua`
only works on macOS. Linux equivalent: `xdg-open`. Needs OS detection.

### 5. Global Lua variable `_LIVE_SERVER`
Should be stored in `vim.g._live_server` or a module-level variable, not a
bare Lua global.

### 6. `autocmds.lua` has wrong file comment header
First line reads `-- lua/chadrc.lua` but the file is `autocmds.lua`.

### 7. README describes a non-existent structure
The README's Project Structure section shows `core/`, `plugins/lsp.lua`,
`plugins/treesitter.lua`, etc. — none of which exist. README must be rewritten
to reflect the actual NvChad-based layout.

### 8. NvimTree opens on every VimEnter
Even when opening a specific file (`nvim foo.py`), the tree is forced open.
Should be conditional: only open when Neovim starts with a directory or no args.

---

## System Dependencies

### Required on Host Machine

| Dependency | Minimum | Notes |
|---|---|---|
| Neovim | `>= 0.9` (recommend `>= 0.10`) | Core requirement |
| Git | Any recent | Lazy.nvim bootstrap |
| Node.js | `>= 18 LTS` | ts_ls, html-lsp, cssls LSP servers |
| npm | Bundled with Node | live-server installation |
| Python 3 | `>= 3.8` | pyright LSP |
| make / gcc | System default | LuaSnip jsregexp build |
| Nerd Font | Any | Icons in UI |
| ripgrep (`rg`) | Any | Telescope live_grep |
| fd | Any | Telescope find_files (performance) |

### External Tools (Not Mason-Managed)

| Tool | Install |
|---|---|
| `live-server` | `npm install -g live-server` |
| `psql` (client) | `brew install libpq && brew link libpq --force` + add `/opt/homebrew/opt/libpq/bin` to PATH |

### Mason-Managed (Auto-Installed)

LSP servers: `typescript-language-server`, `html-lsp`, `css-lsp`, `pyright`, `lua-language-server`, `json-lsp`

Formatters (must be installed manually via `:MasonInstall`):
`prettier`, `black`, `stylua`, `shfmt`

---

## Key Decisions and Conventions

### Plugin Declaration
All custom plugins go in `lua/plugins/init.lua` as a single return table.
Do not split into multiple files unless the list grows beyond ~25 plugins.

### Extending NvChad
Always call the NvChad base before adding custom behavior:
```lua
-- Correct pattern
require "nvchad.options"   -- then add opts
require "nvchad.mappings"  -- then add maps
require "nvchad.autocmds"  -- then add autocmds
require("nvchad.configs.lspconfig").defaults()  -- then add servers
```

### Lazy Loading
All plugins default to lazy (`defaults = { lazy = true }` in `configs/lazy.lua`).
Opt into eager loading only when strictly necessary (e.g., theme, core plugins).

### Formatting Philosophy
Use `conform.nvim` as the single source of truth for formatting.
Do not add redundant autocmds that also call `conform.format()`.

### LSP Philosophy
Mason manages all LSP installations. Never hardcode binary paths.
`mason-lspconfig` bridges Mason packages to lspconfig server names.

---

## What Should NOT Be Modified Lightly

1. **`init.lua`** — The bootstrap order is critical. Changing load order breaks the theme cache, plugin loading, and mappings timing.

2. **`chadrc.lua`** — This is NvChad's configuration interface. Its structure must match `nvconfig.lua` in NvChad UI v3.0. Breaking the schema breaks the entire UI.

3. **`lazy-lock.json`** — Do not manually edit. Update via `:Lazy update` or `:Lazy sync`. Manual edits can corrupt the plugin state.

4. **`configs/lazy.lua` disabled plugins list** — The `disabled_plugins` list removes built-in Vim plugins. Removing entries from it won't cause errors but adds startup overhead. Adding entries incorrectly can break things (e.g., don't disable `filetype`).

5. **The NvChad import in `init.lua`** — `import = "nvchad.plugins"` loads NvChad's full plugin set. Do not remove it. If you want to remove a NvChad plugin, override it with `enabled = false` in your custom plugins table.

6. **Mason-lspconfig `ensure_installed`** — Only use lspconfig server names here (e.g., `ts_ls`, not `tsserver`). Check the mason-lspconfig mappings if unsure.

---

## Guidelines for Future Changes

### Adding a new plugin
1. Add entry to `lua/plugins/init.lua`.
2. If it needs configuration, create `lua/configs/<plugin>.lua` and reference it via `config = function() require("configs.<plugin>") end`.
3. Use `event`, `ft`, `cmd`, or `keys` for lazy loading.
4. Run `:Lazy sync` to install.

### Adding a new LSP server
1. Add server name to `mason-lspconfig.ensure_installed` in `plugins/init.lua`.
2. Add server config to the `servers` table in `configs/lspconfig.lua`.
3. Remove the broken mason-registry loop (see Known Issues #3) before adding more servers.

### Adding a new formatter
1. Add the formatter to `configs/conform.lua` under `formatters_by_ft`.
2. Install it via Mason: `:MasonInstall <formatter>`.
3. Consider adding it to a `ensure_installed` list for formatters (currently missing).

### Changing theme
Edit `chadrc.lua` → `M.base46.theme`. Available themes are in the base46 plugin.
Run `:Telescope themes` (NvChad command) to preview themes live.

### Upgrading NvChad
Run `:Lazy update` for plugins. For NvChad framework upgrades, check the
NvChad changelog first — v2.5 → v3.x may require structural changes to `chadrc.lua`.

---

## Portability Status

| Concern | Status |
|---|---|
| Lazy.nvim bootstrap | Automatic |
| NvChad install | Automatic |
| Plugin install | Automatic (Lazy.nvim) |
| LSP server install | Partially automatic (mason-lspconfig, with tsserver/ts_ls bug) |
| Formatter install | Manual (`:MasonInstall`) |
| live-server | Manual (`npm install -g live-server`) |
| Nerd Font | Manual |
| OS portability | Partial (macOS `open` command hardcoded) |
| Reproducibility | High (lazy-lock.json pins all commits) |
