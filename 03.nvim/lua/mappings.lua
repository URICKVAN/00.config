-- lua/mappings.lua

-- Carga mapeos base de NvChad
require "nvchad.mappings"

-- Atajo local para facilitar escritura de mapeos
local map = vim.keymap.set

-- ==== Mapeos personalizados ====

-- Reasignación: <leader>n ahora togglea NvimTree (antes era <C-n>)
--               <leader>z ahora togglea line numbers (antes era <leader>n)
vim.keymap.del("n", "<leader>n")
map("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>z", "<cmd>set nu!<CR>", { desc = "Toggle line numbers" })

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

-- Sesiones
map("n", "<leader>fs", "<cmd>AutoSession search<CR>", { desc = "Find sessions" })

