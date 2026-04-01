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

-- Habilita los servidores (instalación vía mason-lspconfig ensure_installed)
vim.lsp.enable({ "html", "cssls", "ts_ls", "pyright", "lua_ls" })
