-- ╭────────────────────────────────────────────────────────────────────────────╮
-- │ Init.lua – Archivo principal de arranque de Neovim con NvChad + Lazy.nvim │
-- ╰────────────────────────────────────────────────────────────────────────────╯

-- 📁 Ruta donde se almacenan los archivos de configuración del tema (base46)
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

-- 🧭 Tecla líder (leader key), utilizada para los mapeos personalizados
vim.g.mapleader = " "

-- 🔁 Ruta del plugin manager Lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- 🚀 Si Lazy.nvim no está instalado, lo clona automáticamente
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

-- 📌 Añade Lazy al runtime path
vim.opt.rtp:prepend(lazypath)

-- ⚙️ Carga configuración de Lazy desde `lua/configs/lazy.lua`
local lazy_config = require "configs.lazy"

-- 🧩 Declaración e inicialización de plugins
require("lazy").setup({
  {
    "NvChad/NvChad",    -- Framework base
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  {
    import = "plugins"  -- Tus propios plugins definidos en `lua/plugins/init.lua`
  },
}, lazy_config)

-- 🎨 Carga del tema (colores, statusline)
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- ⚙️ Configuración de opciones generales
require "options"

-- ⚙️ Autocomandos personalizados
require "autocmds"

-- 🎹 Mapeos de teclas (se carga de forma diferida para evitar errores en el arranque)
vim.schedule(function()
  require "mappings"
end)

