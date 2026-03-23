# Mappings Reference

> Last updated: 2026-03-23

`<leader>` = `Space`

**Corne keyboard layout**
- Mano izquierda: `a  o  e  u  i  p  y  q  j  k  x`
- Mano derecha:   `d  h  t  n  s  f  g  c  r  l  b  m  w  v  z`

Fuentes: **P** = personal · **N** = NvChad · **V** = Vim nativo · `—` = libre

---

## `<leader>` · mano izquierda

| Tecla | Modo | Acción | Fuente |
|-------|------|--------|--------|
| `<leader>a` | | — | |
| `<leader>o` | | — | |
| `<leader>e` | n | Focus NvimTree | N |
| `<leader>u` | | — | |
| `<leader>i` | | — | |
| `<leader>p` | | → submenu | |
| ↳ `<leader>ph` | n | Preview git hunk | N |
| ↳ `<leader>pt` | n | Telescope: pick hidden terminal | N |
| `<leader>y` | | — | |
| `<leader>q` | | — | |
| `<leader>j` | | — | |
| `<leader>k` | | — | |
| `<leader>x` | n | Close buffer | N |

---

## `<leader>` · mano derecha

| Tecla | Modo | Acción | Fuente |
|-------|------|--------|--------|
| `<leader>d` | | → submenu | |
| ↳ `<leader>ds` | n | Diagnostics (loclist) | N |
| ↳ `<leader>D` | n | Type definition | N |
| `<leader>h` | n | New horizontal terminal | N |
| `<leader>t` | | → submenu | |
| ↳ `<leader>tt` | n | Float terminal | P |
| ↳ `<leader>tv` | n | Vertical terminal (~80 cols) | P |
| ↳ `<leader>th` | n | Horizontal terminal (15 lines) | P |
| ↳ `<leader>td` | n | Toggle deleted lines (git) | N |
| `<leader>n` | n | Toggle NvimTree | P |
| `<leader>s` | | → submenu | |
| ↳ `<leader>sh` | n | Signature help | N |
| `<leader>f` | | → submenu | |
| ↳ `<leader>ff` | n | Find files | P |
| ↳ `<leader>fg` | n | Live grep | P |
| ↳ `<leader>fw` | n | Live grep (NvChad) | N |
| ↳ `<leader>fb` | n | Find open buffers | N |
| ↳ `<leader>fh` | n | Help pages | N |
| ↳ `<leader>fo` | n | Recent files | N |
| ↳ `<leader>fz` | n | Fuzzy find in buffer | N |
| ↳ `<leader>fs` | n | Find/restore sessions | P |
| ↳ `<leader>fa` | n | Find all files (hidden) | N |
| `<leader>g` | | → submenu | |
| ↳ `<leader>gt` | n | Git status | N |
| ↳ `<leader>gb` | n | Git blame line | N |
| `<leader>c` | | → submenu | |
| ↳ `<leader>ch` | n | NvChad cheatsheet | N |
| ↳ `<leader>ca` | n | Code action | N |
| ↳ `<leader>cm` | n | Git commits | N |
| `<leader>r` | | → submenu | |
| ↳ `<leader>rn` | n | Toggle relative line numbers | N |
| ↳ `<leader>ra` | n | Rename symbol | N |
| ↳ `<leader>rh` | n | Reset git hunk | N |
| `<leader>l` | | → submenu | |
| ↳ `<leader>ls` | n | Toggle Live Server | P |
| ↳ `<leader>lo` | n | Open browser (127.0.0.1:5500) | P |
| `<leader>b` | n | New buffer | N |
| `<leader>m` | | → submenu | |
| ↳ `<leader>ma` | n | Telescope: marks | N |
| `<leader>w` | | → submenu | |
| ↳ `<leader>wa` | n | LSP add workspace folder | N |
| ↳ `<leader>wr` | n | LSP remove workspace folder | N |
| ↳ `<leader>wl` | n | LSP list workspace folders | N |
| ↳ `<leader>wK` | n | WhichKey: all keymaps | N |
| ↳ `<leader>wk` | n | WhichKey: query lookup | N |
| `<leader>v` | n | New vertical terminal | N |
| `<leader>z` | n | Toggle line numbers | P |

> `<leader>/` (n/v) → Toggle comment · **N**

---

## `<C->` · mano izquierda

| Tecla | Modo | Acción | Fuente |
|-------|------|--------|--------|
| `<C-a>` | | — | |
| `<C-o>` | n | Jump back (jump list) | V |
| `<C-e>` | n | Scroll down one line | V |
| `<C-e>` | i | Move to end of line | N |
| `<C-u>` | n | Scroll half page up | V |
| `<C-u>` | i | Delete to start of line | V |
| `<C-i>` | n | Jump forward (jump list) | V |
| `<C-p>` | i | Previous completion item | V |
| `<C-y>` | n | Scroll up one line | V |
| `<C-q>` | n | Visual block mode (alt) | V |
| `<C-j>` | n | Switch window down | N |
| `<C-j>` | i | Move cursor down | N |
| `<C-k>` | n | Switch window up | N |
| `<C-k>` | i | Move cursor up | N |
| `<C-x>` | t | Escape terminal mode | N |

---

## `<C->` · mano derecha

| Tecla | Modo | Acción | Fuente |
|-------|------|--------|--------|
| `<C-d>` | n | Scroll half page down | V |
| `<C-h>` | n | Switch window left | N |
| `<C-h>` | i | Move cursor left | N |
| `<C-t>` | n | Switch window down | P |
| `<C-n>` | n | Switch window right | P |
| `<C-n>` | i | Next completion item | V |
| `<C-s>` | n/i/v | Save file | P |
| `<C-f>` | n | Scroll page down | V |
| `<C-g>` | | — | |
| `<C-c>` | n | Switch window up | P |
| `<C-c>` | i | Salir de insert mode (nativo) | V |
| `<C-r>` | n | Redo | V |
| `<C-r>` | i | Insert register content | V |
| `<C-l>` | n | **libre** | — |
| `<C-l>` | i | Move cursor right | N |
| `<C-b>` | n | Scroll page up | V |
| `<C-b>` | i | Move to beginning of line | N |
| `<C-m>` | | — | |
| `<C-w>` | n | Window commands prefix | V |
| `<C-v>` | n | Visual block mode | V |
| `<C-z>` | n | Suspend (background Neovim) | V |

> `<C-Space>` (i) → Open/refresh completion menu · **P** (nvim-cmp)

---

## `<A->` · mano izquierda

| Tecla | Modo | Acción | Fuente |
|-------|------|--------|--------|
| `<A-a>` | | — | |
| `<A-o>` | | — | |
| `<A-e>` | | — | |
| `<A-u>` | | — | |
| `<A-i>` | n/t | Float terminal (toggle) | N |
| `<A-p>` | | — | |
| `<A-y>` | | — | |
| `<A-q>` | | — | |
| `<A-j>` | | — | |
| `<A-k>` | | — | |
| `<A-x>` | | — | |

---

## `<A->` · mano derecha

| Tecla | Modo | Acción | Fuente |
|-------|------|--------|--------|
| `<A-d>` | | — | |
| `<A-h>` | n/t | Horizontal terminal (toggle) | N |
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
| `<A-v>` | n/t | Vertical terminal (toggle) | N |
| `<A-z>` | | — | |

---

## Sin modificador · mano izquierda

| Tecla | Modo | Acción | Fuente |
|-------|------|--------|--------|
| `a` | n | Insert after cursor | V |
| `A` | n | Insert at end of line | V |
| `o` | n | New line below, insert | V |
| `O` | n | New line above, insert | V |
| `e` | n | End of next word | V |
| `E` | n | End of next WORD | V |
| `u` | n | Undo | V |
| `U` | n | Undo line changes | V |
| `i` | n | Insert before cursor | V |
| `I` | n | Insert at beginning of line | V |
| `p` | n | Paste after cursor | V |
| `P` | n | Paste before cursor | V |
| `y` | n | Yank (operator) | V |
| `yy` / `Y` | n | Yank line | V |
| `q{char}` | n | Record macro | V |
| `@{char}` | n | Play macro | V |
| `j` | n | Move down | V |
| `k` | n | Move up | V |
| `x` | n | Delete char forward | V |
| `X` | n | Delete char backward | V |

---

## Sin modificador · mano derecha

| Tecla | Modo | Acción | Fuente |
|-------|------|--------|--------|
| `d` | n | Delete (operator) | V |
| `dd` | n | Delete line | V |
| `D` | n | Delete to end of line | V |
| `h` | n | Move left | V |
| `t{char}` | n | Move til char (forward) | V |
| `T{char}` | n | Move til char (backward) | V |
| `n` | n | Next search match | V |
| `N` | n | Previous search match | V |
| `s` | n | Substitute char (→ insert) | V |
| `S` | n | Substitute line (→ insert) | V |
| `f{char}` | n | Find char on line | V |
| `F{char}` | n | Find char backward | V |
| `g` | n | Operator prefix | V |
| `gg` | n | Go to first line | V |
| `G` | n | Go to last line | V |
| `c` | n | Change (operator) | V |
| `cc` | n | Change line | V |
| `C` | n | Change to end of line | V |
| `r{char}` | n | Replace char | V |
| `R` | n | Enter replace mode | V |
| `l` | n | Move right | V |
| `b` | n | Back word | V |
| `B` | n | Back WORD | V |
| `m{char}` | n | Set mark | V |
| `w` | n | Next word | V |
| `W` | n | Next WORD | V |
| `v` | n | Visual char mode | V |
| `V` | n | Visual line mode | V |
| `z` | n | Scroll/fold prefix | V |
| `zz` | n | Center cursor on screen | V |
| `zt` | n | Scroll cursor to top | V |
| `zb` | n | Scroll cursor to bottom | V |

---

## Sin modificador · otras teclas

| Tecla | Modo | Acción | Fuente |
|-------|------|--------|--------|
| `;` | n | Enter command mode (alias `:`) | P |
| `jk` | i | Exit insert mode | P |
| `<Esc>` | n | Clear search highlights | N |
| `<Tab>` | n | Next buffer | N |
| `<Tab>` | i | Next completion / jump snippet | P |
| `<S-Tab>` | n | Previous buffer | N |
| `<S-Tab>` | i | Prev completion / jump snippet back | P |
| `<CR>` | i | Confirm completion | P |
| `0` | n | Beginning of line | V |
| `^` | n | First non-blank char | V |
| `$` | n | End of line | V |
| `%` | n | Jump to matching bracket | V |
| `/` | n | Search forward | V |
| `?` | n | Search backward | V |
| `*` | n | Search word under cursor | V |
| `#` | n | Search word backward | V |
| `.` | n | Repeat last change | V |
| `~` | n | Toggle case | V |
| `>` | n/v | Indent | V |
| `<` | n/v | Unindent | V |
| `=` | n/v | Auto-indent | V |
| `{` | n | Jump to prev paragraph | V |
| `}` | n | Jump to next paragraph | V |
| `]c` | n | Next git hunk | N |
| `[c` | n | Previous git hunk | N |
| `K` | n | LSP hover documentation | N/V |
| `gD` | n | LSP go to declaration | N |
| `gd` | n | LSP go to definition | N |
| `gi` | n | LSP go to implementation | N/V |
| `gr` | n | LSP list references | N/V |

---

## NvimTree (panel enfocado)

| Tecla | Acción |
|-------|--------|
| `<CR>` / `o` | Abrir archivo / expandir carpeta |
| `a` | Crear archivo o directorio |
| `d` | Eliminar |
| `r` | Renombrar |
| `x` | Cortar |
| `c` | Copiar |
| `p` | Pegar |
| `y` | Copiar nombre de archivo |
| `Y` | Copiar ruta relativa |
| `gy` | Copiar ruta absoluta |
| `H` | Toggle archivos ocultos |
| `I` | Toggle archivos ignorados por git |
| `<C-v>` | Abrir en split vertical |
| `<C-x>` | Abrir en split horizontal |
| `<C-t>` | Abrir en nueva pestaña |
| `q` | Cerrar NvimTree |
| `?` | Toggle ayuda |

---

## Autocompletado · nvim-cmp (insert mode)

| Tecla | Acción | Fuente |
|-------|--------|--------|
| `<C-Space>` | Abrir / refrescar menú | P |
| `<CR>` | Confirmar selección | P |
| `<Tab>` | Siguiente item / expandir / jump snippet | P |
| `<S-Tab>` | Item anterior / jump snippet back | P |

---

## Surround · nvim-surround

| Modo | Tecla | Acción | Ejemplo |
|------|-------|--------|---------|
| n | `ys{motion}{char}` | Añadir surround | `ysiw"` → `"word"` |
| n | `ds{char}` | Eliminar surround | `ds"` → `word` |
| n | `cs{old}{new}` | Cambiar surround | `cs"'` → `'word'` |
| v | `S{char}` | Rodear selección | `S)` → `(selección)` |

---

## Emmet · emmet-vim

Activo en: `html css javascriptreact typescriptreact vue svelte`

| Modo | Tecla | Acción |
|------|-------|--------|
| i | `<C-Z>,` | Expandir abreviatura Emmet |

> Ejemplo: `div.container>ul>li*3` → `<C-Z>,`

---

## Markdown · render-markdown.nvim

Activo automáticamente en `*.md`. Sin keymaps — render en tiempo real.

| Comando | Acción |
|---------|--------|
| `:RenderMarkdown enable` | Activar en buffer actual |
| `:RenderMarkdown disable` | Desactivar en buffer actual |
| `:RenderMarkdown toggle` | Alternar |

---

## Sessions · auto-session

| Modo | Tecla | Acción | Fuente |
|------|-------|--------|--------|
| n | `<leader>fs` | Abrir selector de sesiones | P |

Sessions se guardan/restauran automáticamente al salir/entrar.
NvimTree se cierra antes del save y reabre tras restore.
Directorios suprimidos: `~/`, `~/Downloads`, `~/Desktop`, `/`.
