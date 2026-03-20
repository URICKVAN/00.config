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
| `n` | `<leader>n` | Toggle line numbers |
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

## Sessions — auto-session

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<leader>fs` | Open session picker (Telescope) |

Sessions are saved/restored automatically on exit/enter.
NvimTree is closed before save and reopened after restore.
Suppressed directories: `~/`, `~/Downloads`, `~/Desktop`, `/`.
