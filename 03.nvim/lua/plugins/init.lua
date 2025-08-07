-- lua/plugins/init.lua
-- Aquí defines todos los plugins personalizados que deseas usar en tu instalación de NvChad

return {

  -- 🧠 LSP principal
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  -- 🧰 Mason: gestor de herramientas externas (LSPs, linters, formatters…)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- Actualiza automáticamente los índices al instalar
    config = function()
      require("mason").setup()
    end,
  },

  -- 🔗 Integración Mason ↔ LSPConfig: instala LSPs automáticamente
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

  -- 🧹 Formateo automático multi-lenguaje (Prettier, Black, Stylua, shfmt…)
  {
    "stevearc/conform.nvim",
    config = function()
      require("configs.conform")
    end,
  },

  -- 🧱 Terminal flotante toggleable
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

  -- 🏷️ Autocierre/renombrado de etiquetas HTML/JSX/TSX
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- 🔄 Rodear texto con comillas, paréntesis, llaves, etiquetas, etc.
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- ⚡ Emmet para expansión rápida (HTML/CSS/React/Vue/Svelte)
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

  -- 🧩 Snippets + colección VSCode (incluye React/TS/HTML/CSS…)
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp", -- regex avanzada en snippets
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")
      -- Carga snippets estilo VSCode (friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()
      -- (Opcional) Cargar snippets propios desde ~/.config/nvim/snippets
      -- require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      })
    end,
  },

  -- 🔮 Autocompletado con integración de LSP, LuaSnip, buffer y path
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",   -- fuente: LSP
      "hrsh7th/cmp-buffer",     -- fuente: palabras del buffer
      "hrsh7th/cmp-path",       -- fuente: paths
      "saadparwaiz1/cmp_luasnip", -- fuente: LuaSnip
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),          -- mostrar sugerencias
          ["<CR>"]      = cmp.mapping.confirm({ select = true }), -- confirmar selección
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- (Opcional pero recomendado) Íconos de archivo para NvimTree, lualine, etc.
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}
