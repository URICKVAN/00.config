-- lua/configs/lspconfig.lua

-- Carga la configuración por defecto de LSP en NvChad
require("nvchad.configs.lspconfig").defaults()

-- Lista de servidores con su configuración personalizada si se desea
local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
  pyright = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }, -- Evita advertencias por uso de 'vim'
        },
      },
    },
  },
}

-- Configura cada servidor
local lspconfig = require("lspconfig")
for server, config in pairs(servers) do
  lspconfig[server].setup(config)
end

-- Asegura que todos estén instalados vía Mason
local mason_registry = require("mason-registry")
for server_name, _ in pairs(servers) do
  local ok, pkg = pcall(mason_registry.get_package, server_name)
  if ok and not pkg:is_installed() then
    vim.notify("Instalando LSP: " .. server_name)
    pkg:install()
  end
end

