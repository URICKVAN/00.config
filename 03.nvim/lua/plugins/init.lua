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
          "jsonls",     -- JSON
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
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", desc = "Terminal flotante" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<CR>", desc = "Terminal vertical" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal size=15<CR>", desc = "Terminal horizontal" },

      -- Live Server persistente (toggle sin matar el proceso)
      {
        "<leader>ls",
        function()
          if not _LIVE_SERVER then
            local Terminal = require("toggleterm.terminal").Terminal
            _LIVE_SERVER = Terminal:new({
              cmd = "live-server --port=5500 --open=.", -- quita --open si no quieres abrir navegador
              dir = "git_dir",          -- usa la raíz del repo (o "cwd" para el dir actual)
              direction = "float",      -- cámbialo a "horizontal" si prefieres
              hidden = true,
              close_on_exit = false,    -- ⚡ no mata el proceso al cerrar la ventana
              start_in_insert = true,
            })
          end
          _LIVE_SERVER:toggle()
        end,
        desc = "Live Server (toggle persistente)",
      },

      -- (Opcional) Reabrir el sitio en el navegador (macOS usa `open`)
      {
        "<leader>lo",
        function()
          vim.fn.jobstart({ "open", "http://127.0.0.1:5500" }, { detach = true })
        end,
        desc = "Abrir sitio en el navegador",
      },
    },
    cmd = { "ToggleTerm", "TermExec", "ToggleTermToggleAll" },
    config = function()
      require("toggleterm").setup({
        -- Tamaño agradable según dirección
        size = function(term)
          if term.direction == "horizontal" then
            return 14
          elseif term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.38)
          end
          return 14
        end,
        direction = "float",
        shade_terminals = true,
        shading_factor = 2,
        float_opts = { border = "curved" },
        start_in_insert = true,
        persist_size = true,
      })

      -- Limpieza visual para terminales
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.signcolumn = "no"
          vim.opt_local.cursorline = false
          vim.opt_local.wrap = false
          vim.opt_local.spell = false
        end,
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

  -- 🌲 NvimTree: mostrar archivos ignorados por git (.env, etc.)
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        git_ignored = false,
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "A", function()
          local node = api.tree.get_node_under_cursor()
          local base = node and (node.type == "directory" and node.absolute_path
            or vim.fn.fnamemodify(node.absolute_path, ":h")) or vim.loop.cwd()

          vim.ui.input({ prompt = "Archivo (p.ej. qualitas_.txt): " }, function(input)
            if not input or input == "" then return end
            local ts = os.date("%Y%m%d_%H%M%S")
            local dot = input:find("%.[^.]*$")
            local final = dot
              and (input:sub(1, dot - 1) .. ts .. input:sub(dot))
              or  (input .. ts)
            local full = base .. "/" .. final
            vim.fn.writefile({}, full)
            api.tree.reload()
            vim.cmd("edit " .. vim.fn.fnameescape(full))
          end)
        end, { buffer = bufnr, desc = "Crear archivo con timestamp", nowait = true })
      end,
    },
  },

  -- 📄 Render Markdown en el buffer (tablas, headings, code blocks, etc.)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("render-markdown").setup({
        heading = {
          enabled = true,
          sign = false,
        },
        code = {
          enabled = true,
          sign = false,
          style = "full",   -- "full" | "normal" | "language" | "none"
        },
        bullet = { enabled = true },
        checkbox = { enabled = true },
        table = { enabled = true },
        link = { enabled = true },
      })
    end,
  },

  -- 💾 Gestión de sesiones automática (con telescope integrado)
  {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("auto-session").setup({
        log_level = "error",
        suppressed_dirs = { "~/", "~/Downloads", "~/Desktop", "/" },
        pre_save_cmds = { "NvimTreeClose" },
        post_restore_cmds = { function() vim.schedule(function() vim.cmd("NvimTreeOpen") end) end },
        session_lens = {
          load_on_setup = true,
          previewer = false,
        },
      })
    end,
  },

  -- 📋 JSON Schema Store: provee schemas para jsonls (package.json, tsconfig, etc.)
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },

  -- 🔽 Folding moderno con preview (ufo = ultra fold)
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    config = function()
      require("ufo").setup({
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      })
    end,
  },

  -- 🔀 Split/join nodos (expande/colapsa objetos JSON, arrays, args…)
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>j", "<cmd>TSJToggle<CR>", desc = "Split/join nodo" },
    },
    config = function()
      require("treesj").setup({ use_default_keymaps = false })
    end,
  },

  -- 🗄️ Gestor de base de datos (PostgreSQL, MySQL, SQLite, Redis…)
  {
    "tpope/vim-dadbod",
    lazy = true,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = vim.fn.expand("~/.local/share/db_ui")
      vim.g.db_ui_auto_execute_table_helpers = 1
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = { "tpope/vim-dadbod" },
    ft = { "sql", "mysql", "plsql" },
    config = function()
      require("cmp").setup.filetype({ "sql", "mysql", "plsql" }, {
        sources = require("cmp").config.sources({
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        }),
      })
    end,
  },
}
