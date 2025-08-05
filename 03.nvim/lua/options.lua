-- lua/options.lua

-- Carga las opciones por defecto de NvChad
require "nvchad.options"

local opt = vim.opt

-- === Apariencia ===
opt.number = true             -- Muestra números de línea absolutos
opt.relativenumber = true     -- Muestra números relativos para facilitar navegación
opt.cursorline = true         -- Resalta la línea actual
opt.cursorlineopt = "both"    -- Resalta número de línea y línea entera
opt.signcolumn = "yes"        -- Siempre muestra la columna de signos (Git, LSP)
opt.termguicolors = true      -- Habilita colores verdaderos
opt.wrap = false              -- No envuelve líneas largas

-- === Scroll ===
opt.scrolloff = 8             -- Mantiene 8 líneas de margen vertical
opt.sidescrolloff = 8         -- Mantiene 8 columnas de margen horizontal

-- === Indentación ===
opt.expandtab = true          -- Usa espacios en lugar de tabulaciones
opt.shiftwidth = 2            -- Número de espacios para cada nivel de indentación
opt.tabstop = 2               -- Tamaño de tabulación (visual)
opt.smartindent = true        -- Habilita indentación inteligente

-- === Búsqueda ===
opt.ignorecase = true         -- Ignora mayúsculas en búsqueda por defecto
opt.smartcase = true          -- Respeta mayúsculas si se usan en la búsqueda

-- === Portapapeles ===
opt.clipboard = "unnamedplus" -- Usa el portapapeles del sistema

-- === Splits ===
opt.splitright = true         -- Los splits verticales se abren a la derecha
opt.splitbelow = true         -- Los splits horizontales se abren abajo

