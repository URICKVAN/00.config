-- lua/mappings.lua

-- Carga mapeos base de NvChad
require "nvchad.mappings"

-- Atajo local para facilitar escritura de mapeos
local map = vim.keymap.set

-- ==== Mapeos personalizados ====

-- Navegación de ventanas (normal mode)
-- <C-h> izq · <C-n> der · <C-k> arriba · <C-j> abajo  ← NvChad (h/k/j activos)
-- <C-n>  reemplaza <C-l> (switch right), <C-l> libre
-- <C-c>  reemplaza <C-k> (switch up),   <C-c> copy-file eliminado
-- <C-t>  reemplaza <C-j> (switch down)
vim.keymap.del("n", "<leader>n")
vim.keymap.del("n", "<C-n>")
vim.keymap.del("n", "<C-l>")
vim.keymap.del("n", "<C-c>")
map("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<C-n>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-c>", "<C-w>k", { desc = "switch window up" })
map("n", "<C-t>", "<C-w>j", { desc = "switch window down" })
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

-- Base de datos (vim-dadbod-ui)
map("n", "<leader>db", "<cmd>DBUIToggle<CR>",       { desc = "Toggle DB UI" })
map("n", "<leader>da", "<cmd>DBUIAddConnection<CR>", { desc = "Add DB connection" })
map("n", "<leader>df", "<cmd>DBUIFindBuffer<CR>",    { desc = "Find DB buffer" })

-- Folding (nvim-ufo)
map("n", "zR", function() require("ufo").openAllFolds() end,  { desc = "Abrir todos los folds" })
map("n", "zM", function() require("ufo").closeAllFolds() end, { desc = "Cerrar todos los folds" })

