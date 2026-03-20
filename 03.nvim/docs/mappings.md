# Mappings Reference

> Auto-generated from `lua/mappings.lua` and `lua/plugins/init.lua`.
> **Update this file whenever a mapping is added, changed, or removed.**
> Last updated: 2026-03-20

`<leader>` = `Space`

---

## General

| Mode | Key | Action |
|------|-----|--------|
| `n` | `;` | Enter command mode (alias for `:`) |
| `i` | `jk` | Exit insert mode (alias for `<Esc>`) |
| `n/i/v` | `<C-s>` | Save file |
| `n` | `<Esc>` | Clear search highlights |
| `n` | `<C-c>` | Copy whole file to clipboard |
| `n` | `<leader>z` | Toggle line numbers |
| `n` | `<leader>rn` | Toggle relative line numbers |
| `n` | `<leader>ch` | NvChad cheatsheet |

---

## Window Navigation

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<C-h>` | Focus window left |
| `n` | `<C-l>` | Focus window right |
| `n` | `<C-j>` | Focus window down |
| `n` | `<C-k>` | Focus window up |

---

## Buffers

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<Tab>` | Next buffer |
| `n` | `<S-Tab>` | Previous buffer |
| `n` | `<leader>x` | Close current buffer |
| `n` | `<leader>b` | New buffer |

---

## File Explorer — NvimTree

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<C-n>` | Toggle NvimTree |
| `n` | `<leader>n` | Toggle NvimTree |
| `n` | `<leader>e` | Focus NvimTree |

---

## Telescope (Search)

| Mode | Key | Action | Source |
|------|-----|--------|--------|
| `n` | `<leader>ff` | Find files | custom |
| `n` | `<leader>fg` | Live grep (project-wide) | custom |
| `n` | `<leader>fw` | Live grep | NvChad |
| `n` | `<leader>fb` | Find open buffers | NvChad |
| `n` | `<leader>fh` | Help pages | NvChad |
| `n` | `<leader>fo` | Recent files (oldfiles) | NvChad |
| `n` | `<leader>fz` | Fuzzy find in current buffer | NvChad |
| `n` | `<leader>cm` | Git commits | NvChad |
| `n` | `<leader>gt` | Git status | NvChad |
| `n` | `<leader>fs` | Find & restore sessions | auto-session |

> `<leader>ff` and `<leader>fw` do the same thing (find_files / live_grep). The custom ones override NvChad's if they conflict.

---

## LSP

| Mode | Key | Action |
|------|-----|--------|
| `n` | `gD` | Go to declaration |
| `n` | `gd` | Go to definition |
| `n` | `gi` | Go to implementation |
| `n` | `gr` | List references |
| `n` | `K` | Hover documentation |
| `n` | `<leader>sh` | Signature help |
| `n` | `<leader>D` | Type definition |
| `n` | `<leader>ra` | Rename symbol |
| `n` | `<leader>ca` | Code action |
| `n` | `<leader>fm` | Format file (conform / LSP fallback) |
| `n` | `<leader>ds` | Show diagnostics float |
| `n` | `<leader>wa` | Add workspace folder |
| `n` | `<leader>wr` | Remove workspace folder |
| `n` | `<leader>wl` | List workspace folders |

---

## Git — Gitsigns

| Mode | Key | Action |
|------|-----|--------|
| `n` | `]c` | Next git hunk |
| `n` | `[c` | Previous git hunk |
| `n` | `<leader>rh` | Reset hunk |
| `n` | `<leader>ph` | Preview hunk |
| `n` | `<leader>gb` | Git blame current line |
| `n` | `<leader>td` | Toggle deleted lines |

---

## Terminal — toggleterm.nvim

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<leader>tt` | Toggle float terminal |
| `n` | `<leader>tv` | Toggle vertical terminal (~38% width) |
| `n` | `<leader>th` | Toggle horizontal terminal (14 lines) |
| `n` | `<A-i>` | NvChad float terminal (toggle) |
| `n` | `<A-h>` | NvChad horizontal terminal |
| `n` | `<A-v>` | NvChad vertical terminal |

> ⚠️ `<leader>th` conflicts with NvChad's theme picker. toggleterm wins (declared later by Lazy.nvim).

---

## Live Server — toggleterm.nvim

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<leader>ls` | Toggle Live Server (port 5500, persistent process) |
| `n` | `<leader>lo` | Open `http://127.0.0.1:5500` in browser (macOS only) |

---

## Autocompletion — nvim-cmp

Active in **insert mode** when the completion popup is visible.

| Key | Action |
|-----|--------|
| `<C-Space>` | Open / refresh completion menu |
| `<CR>` | Confirm selected item |
| `<Tab>` | Select next item · expand / jump forward in snippet |
| `<S-Tab>` | Select previous item · jump backward in snippet |

---

## Snippets — LuaSnip

Controlled via `<Tab>` / `<S-Tab>` inside nvim-cmp (see above).
Snippets sourced from `friendly-snippets` (VSCode-style: JS, TS, HTML, Python, etc.).

---

## Surround — nvim-surround

Operator-style: works with any motion. No leader required.

| Mode | Key | Action | Example |
|------|-----|--------|---------|
| `n` | `ys{motion}{char}` | Add surround | `ysiw"` → surround word with `"` |
| `n` | `ds{char}` | Delete surround | `ds"` → remove surrounding `"` |
| `n` | `cs{old}{new}` | Change surround | `cs"'` → change `"` to `'` |
| `v` | `S{char}` | Surround selection | `S)` → wrap selection with `()` |

---

## Emmet — emmet-vim

Active only in: `html`, `css`, `javascriptreact`, `typescriptreact`, `vue`, `svelte`.

| Mode | Key | Action |
|------|-----|--------|
| `i` | `<C-Z>,` | Expand Emmet abbreviation |

> Example: type `div.container>ul>li*3` then press `<C-Z>,`.

---

## NvimTree — internal keymaps

While the NvimTree panel is focused:

| Key | Action |
|-----|--------|
| `<CR>` or `o` | Open file / expand folder |
| `a` | Create file or directory |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `y` | Copy filename |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |
| `H` | Toggle hidden files |
| `I` | Toggle git-ignored files |
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `q` | Close NvimTree |
| `?` | Toggle help |

---

## Markdown — render-markdown.nvim

Activo automáticamente en buffers `*.md`. No requiere keymaps — el render es en tiempo real.

| Comando | Acción |
|---------|--------|
| `:RenderMarkdown enable` | Activar render en el buffer actual |
| `:RenderMarkdown disable` | Desactivar render en el buffer actual |
| `:RenderMarkdown toggle` | Alternar activado/desactivado |
| `:RenderMarkdown expand` | Expandir todos los elementos |
| `:RenderMarkdown contract` | Contraer todos los elementos |

---

## Sessions — auto-session

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<leader>fs` | Open session picker (Telescope) |

Sessions are saved/restored automatically on exit/enter.
NvimTree is closed before save and reopened after restore.
Suppressed directories: `~/`, `~/Downloads`, `~/Desktop`, `/`.

---

## Quick Reference by Key Prefix

### `<leader>` (Space)

| Key | Action | Category |
|-----|--------|----------|
| `<leader>b` | New buffer | Buffers |
| `<leader>x` | Close buffer | Buffers |
| `<leader>z` | Toggle line numbers | General |
| `<leader>rn` | Toggle relative numbers | General |
| `<leader>ch` | NvChad cheatsheet | General |
| `<leader>n` | Toggle NvimTree | File Explorer |
| `<leader>e` | Focus NvimTree | File Explorer |
| `<leader>ff` | Find files | Telescope |
| `<leader>fg` | Live grep | Telescope |
| `<leader>fw` | Live grep (NvChad) | Telescope |
| `<leader>fb` | Find buffers | Telescope |
| `<leader>fh` | Help pages | Telescope |
| `<leader>fo` | Recent files | Telescope |
| `<leader>fz` | Fuzzy find in buffer | Telescope |
| `<leader>fs` | Find/restore sessions | Sessions |
| `<leader>cm` | Git commits | Telescope |
| `<leader>gt` | Git status | Telescope |
| `<leader>sh` | Signature help | LSP |
| `<leader>D` | Type definition | LSP |
| `<leader>ra` | Rename symbol | LSP |
| `<leader>ca` | Code action | LSP |
| `<leader>fm` | Format file | LSP |
| `<leader>ds` | Diagnostics float | LSP |
| `<leader>wa` | Add workspace folder | LSP |
| `<leader>wr` | Remove workspace folder | LSP |
| `<leader>wl` | List workspace folders | LSP |
| `<leader>rh` | Reset hunk | Git |
| `<leader>ph` | Preview hunk | Git |
| `<leader>gb` | Git blame line | Git |
| `<leader>td` | Toggle deleted lines | Git |
| `<leader>tt` | Float terminal | Terminal |
| `<leader>tv` | Vertical terminal | Terminal |
| `<leader>th` | Horizontal terminal | Terminal |
| `<leader>ls` | Toggle Live Server | Live Server |
| `<leader>lo` | Open Live Server in browser | Live Server |

---

### `<C->` (Ctrl)

| Key | Mode | Action | Category |
|-----|------|--------|----------|
| `<C-s>` | n/i/v | Save file | General |
| `<C-c>` | n | Copy whole file | General |
| `<C-h>` | n | Focus window left | Windows |
| `<C-l>` | n | Focus window right | Windows |
| `<C-j>` | n | Focus window down | Windows |
| `<C-k>` | n | Focus window up | Windows |
| `<C-n>` | n | Toggle NvimTree | File Explorer |
| `<C-Space>` | i | Open completion menu | Completion |
| `<C-Z>,` | i | Expand Emmet | Emmet |
| `<C-v>` | NvimTree | Open in vertical split | NvimTree |
| `<C-x>` | NvimTree | Open in horizontal split | NvimTree |
| `<C-t>` | NvimTree | Open in new tab | NvimTree |

---

### `<A->` (Alt)

| Key | Mode | Action | Category |
|-----|------|--------|----------|
| `<A-i>` | n | Float terminal (NvChad) | Terminal |
| `<A-h>` | n | Horizontal terminal (NvChad) | Terminal |
| `<A-v>` | n | Vertical terminal (NvChad) | Terminal |

---

### Sin prefijo / Otros

| Key | Mode | Action | Category |
|-----|------|--------|----------|
| `;` | n | Enter command mode | General |
| `jk` | i | Exit insert mode | General |
| `<Esc>` | n | Clear search highlights | General |
| `<Tab>` | n | Next buffer | Buffers |
| `<S-Tab>` | n | Previous buffer | Buffers |
| `<Tab>` | i | Next completion / snippet jump | Completion |
| `<S-Tab>` | i | Prev completion / snippet jump | Completion |
| `<CR>` | i | Confirm completion | Completion |
| `gD` | n | Go to declaration | LSP |
| `gd` | n | Go to definition | LSP |
| `gi` | n | Go to implementation | LSP |
| `gr` | n | List references | LSP |
| `K` | n | Hover documentation | LSP |
| `]c` | n | Next git hunk | Git |
| `[c` | n | Previous git hunk | Git |
| `ys{motion}{char}` | n | Add surround | Surround |
| `ds{char}` | n | Delete surround | Surround |
| `cs{old}{new}` | n | Change surround | Surround |
| `S{char}` | v | Surround selection | Surround |

---

## Corne Keyboard Layout

> Mano izquierda: `a  o  e  u  i  p  y  q  j  k  x`
> Mano derecha:   `d  h  t  n  s  f  g  c  r  l  b  m  w  v  z`
> `—` = libre (sin asignar) · Las teclas con `→ submenu` esperan una segunda tecla.

---

### `<leader>` · mano izquierda

| Tecla | Acción | Categoría |
|-------|--------|-----------|
| `<leader>a` | — | |
| `<leader>o` | — | |
| `<leader>e` | Focus NvimTree | File Explorer |
| `<leader>u` | — | |
| `<leader>i` | — | |
| `<leader>p` | → **submenu** | |
| ↳ `<leader>ph` | Preview hunk | Git |
| `<leader>y` | — | |
| `<leader>q` | — | |
| `<leader>j` | — | |
| `<leader>k` | — | |
| `<leader>x` | Close buffer | Buffers |

### `<leader>` · mano derecha

| Tecla | Acción | Categoría |
|-------|--------|-----------|
| `<leader>d` | → **submenu** | |
| ↳ `<leader>ds` | Diagnostics float | LSP |
| ↳ `<leader>D` | Type definition | LSP |
| `<leader>h` | — | |
| `<leader>t` | → **submenu** | |
| ↳ `<leader>tt` | Float terminal | Terminal |
| ↳ `<leader>tv` | Vertical terminal | Terminal |
| ↳ `<leader>th` | Horizontal terminal | Terminal |
| ↳ `<leader>td` | Toggle deleted lines | Git |
| `<leader>n` | Toggle NvimTree | File Explorer |
| `<leader>s` | → **submenu** | |
| ↳ `<leader>sh` | Signature help | LSP |
| `<leader>f` | → **submenu** | |
| ↳ `<leader>ff` | Find files | Telescope |
| ↳ `<leader>fg` | Live grep | Telescope |
| ↳ `<leader>fw` | Live grep (NvChad) | Telescope |
| ↳ `<leader>fb` | Find buffers | Telescope |
| ↳ `<leader>fh` | Help pages | Telescope |
| ↳ `<leader>fo` | Recent files | Telescope |
| ↳ `<leader>fz` | Fuzzy find in buffer | Telescope |
| ↳ `<leader>fs` | Find/restore sessions | Sessions |
| `<leader>g` | → **submenu** | |
| ↳ `<leader>gt` | Git status | Telescope |
| ↳ `<leader>gb` | Git blame line | Git |
| `<leader>c` | → **submenu** | |
| ↳ `<leader>ch` | NvChad cheatsheet | General |
| ↳ `<leader>ca` | Code action | LSP |
| ↳ `<leader>cm` | Git commits | Telescope |
| `<leader>r` | → **submenu** | |
| ↳ `<leader>rn` | Toggle relative numbers | General |
| ↳ `<leader>ra` | Rename symbol | LSP |
| ↳ `<leader>rh` | Reset hunk | Git |
| `<leader>l` | → **submenu** | |
| ↳ `<leader>ls` | Toggle Live Server | Live Server |
| ↳ `<leader>lo` | Open browser (127.0.0.1:5500) | Live Server |
| `<leader>b` | New buffer | Buffers |
| `<leader>m` | — | |
| `<leader>w` | → **submenu** | |
| ↳ `<leader>wa` | Add workspace folder | LSP |
| ↳ `<leader>wr` | Remove workspace folder | LSP |
| ↳ `<leader>wl` | List workspace folders | LSP |
| `<leader>v` | — | |
| `<leader>z` | Toggle line numbers | General |

---

### `<C->` · mano izquierda

| Tecla | Modo | Acción | Categoría |
|-------|------|--------|-----------|
| `<C-a>` | | — | |
| `<C-o>` | | — | |
| `<C-e>` | | — | |
| `<C-u>` | | — | |
| `<C-i>` | | — | |
| `<C-p>` | | — | |
| `<C-y>` | | — | |
| `<C-q>` | | — | |
| `<C-j>` | n | Focus window down | Windows |
| `<C-k>` | n | Focus window up | Windows |
| `<C-x>` | NvimTree | Open in horizontal split | NvimTree |

### `<C->` · mano derecha

| Tecla | Modo | Acción | Categoría |
|-------|------|--------|-----------|
| `<C-d>` | | — | |
| `<C-h>` | n | Focus window left | Windows |
| `<C-t>` | NvimTree | Open in new tab | NvimTree |
| `<C-n>` | n | Toggle NvimTree | File Explorer |
| `<C-s>` | n/i/v | Save file | General |
| `<C-f>` | | — | |
| `<C-g>` | | — | |
| `<C-c>` | n | Copy whole file to clipboard | General |
| `<C-r>` | | — | |
| `<C-l>` | n | Focus window right | Windows |
| `<C-b>` | | — | |
| `<C-m>` | | — | |
| `<C-w>` | | — | |
| `<C-v>` | NvimTree | Open in vertical split | NvimTree |
| `<C-z>` | | — | |

> `<C-Space>` (insert) → Open completion menu

---

### `<A->` · mano izquierda

| Tecla | Modo | Acción | Categoría |
|-------|------|--------|-----------|
| `<A-a>` | | — | |
| `<A-o>` | | — | |
| `<A-e>` | | — | |
| `<A-u>` | | — | |
| `<A-i>` | n | Float terminal (NvChad) | Terminal |
| `<A-p>` | | — | |
| `<A-y>` | | — | |
| `<A-q>` | | — | |
| `<A-j>` | | — | |
| `<A-k>` | | — | |
| `<A-x>` | | — | |

### `<A->` · mano derecha

| Tecla | Modo | Acción | Categoría |
|-------|------|--------|-----------|
| `<A-d>` | | — | |
| `<A-h>` | n | Horizontal terminal (NvChad) | Terminal |
| `<A-t>` | | — | |
| `<A-n>` | | — | |
| `<A-s>` | | — | |
| `<A-f>` | | — | |
| `<A-g>` | | — | |
| `<A-c>` | | — | |
| `<A-r>` | | — | |
| `<A-l>` | | — | |
| `<A-b>` | | — | |
| `<A-m>` | | — | |
| `<A-w>` | | — | |
| `<A-v>` | n | Vertical terminal (NvChad) | Terminal |
| `<A-z>` | | — | |
