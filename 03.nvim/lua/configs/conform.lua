-- lua/configs/conform.lua

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript        = { "prettier" },
    javascriptreact   = { "prettier" },
    typescript        = { "prettier" },
    typescriptreact   = { "prettier" },
    html              = { "prettier" },
    css               = { "prettier" },
    json              = { "prettier" },
    lua               = { "stylua" },
    python            = { "black" },
    sh                = { "shfmt" },
  },

  -- Autoformateo al guardar archivo
  format_on_save = {
    lsp_fallback = true, -- Usa LSP si no se encuentra un formateador
    timeout_ms = 1000,   -- Tiempo máximo de espera para formatear
  },

  -- Puedes descomentar si deseas formatear manualmente con :ConformFormat
  -- formatters = {
  --   prettier = {
  --     prepend_args = { "--single-quote", "--trailing-comma=all" },
  --   },
  -- },
})

