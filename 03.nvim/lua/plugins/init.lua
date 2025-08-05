-- lua/plugins/init.lua
-- Aquí defines todos los plugins personalizados que deseas usar en tu instalación de NvChad

return {

  -- 🧠 Plugin principal para configurar LSPs
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  -- 🔧 Mason: gestor de herramientas externas como LSPs, DAPs, formatters, linters, etc.
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- Actualiza automáticamente al instalar
    config = function()
      require("mason").setup()
    end,
  },

  -- 🔗 Integración entre Mason y LSPConfig para instalación automática de servidores
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",   -- TypeScript / JavaScript
          "html",       -- HTML
          "cssls",      -- CSS
          "pyright",    -- Python
          "lua_ls",     -- Lua
        },
      })
    end,
  },

  -- 🧹 Formateo automático con soporte para múltiples lenguajes
  {
    "stevearc/conform.nvim",
    config = function()
      require("configs.conform")
    end,
  },

  -- 🧱 Terminal integrada con toggle flotante
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        open_mapping = [[<leader>tt]],
      })
    end,
  },

  -- 🏷️ Autocierre y renombrado automático de etiquetas HTML/JSX
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- 🔄 Plugin para rodear texto con comillas, paréntesis, llaves, etc.
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- ⚡ Emmet para expansión rápida en HTML, CSS, React, Vue, Svelte, etc.
  {
    "mattn/emmet-vim",
    ft = {
      "html", "css", "javascriptreact",
      "typescriptreact", "vue", "svelte",
    },
    init = function()
      vim.g.user_emmet_leader_key = "<C-Z>"
    end,
  },
}

