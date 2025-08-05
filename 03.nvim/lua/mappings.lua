-- lua/mappings.lua

-- Carga mapeos base de NvChad
require "nvchad.mappings"

-- Atajo local para facilitar escritura de mapeos
local map = vim.keymap.set

-- ==== Mapeos personalizados ====

-- Normal mode: usa ; para entrar a modo comando (en lugar de Shift+;)
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Insert mode: usa jk para salir de inserción (como alternativa a Esc)
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Todos los modos: guarda archivo con Ctrl+S
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- NvimTree: alternar visor de archivos
-- map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Telescope: búsqueda rápida de archivos y contenido
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })

-- Terminal flotante
map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle terminal" })

