-- lua/configs/lspconfig.lua

require("nvchad.configs.lspconfig").defaults()

-- Configuración personalizada por servidor (solo lo que difiere del default)
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- JSON Schema Store: asocia schemas automáticamente a archivos conocidos
vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

-- Habilita los servidores (instalación vía mason-lspconfig ensure_installed)
vim.lsp.enable({ "html", "cssls", "ts_ls", "pyright", "lua_ls", "jsonls" })
