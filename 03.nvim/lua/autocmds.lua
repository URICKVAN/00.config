-- lua/chadrc.lua
-- Archivo de configuración personalizado para NvChad
-- Carga temas, autocomandos y opciones extendidas

require "nvchad.autocmds" -- Carga los autocmds definidos por defecto en NvChad

-- Paleta y apariencia
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#333333" })  -- Puedes usar esto para personalizar la línea del cursor

-- Extensiones de archivos que serán autoformateados
local patterns = {
  "*.js", "*.jsx", "*.ts", "*.tsx",  -- JavaScript / TypeScript
  "*.html", "*.css", "*.json",       -- Web
  "*.py", "*.sh"                     -- Python / Bash
}

-- === 🛠️ Autoformateo === --

-- 🧹 Formatea automáticamente al salir del modo Insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = patterns,
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- 💾 Formatea automáticamente antes de guardar el buffer
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = patterns,
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- === 📁 Abrir NvimTree al iniciar con 'nvim .' === --
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

