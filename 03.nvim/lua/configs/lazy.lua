-- lua/configs/lazy.lua
-- Configuración personalizada para el gestor de plugins Lazy.nvim
return {
   -- Todos los plugins por defecto se cargan como "lazy"
  defaults = { lazy = true },
  -- Colorescheme a instalar por defecto (asegúrate de que esté incluido en tu lista de plugins)
  install = { colorscheme = { "nvchad" } },
   -- Configuración de la UI de Lazy
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },
  -- Optimización de rendimiento
  performance = {
    rtp = {
      -- Deshabilita plugins de Vim que no necesitas para mejorar velocidad de arranque
      disabled_plugins = {
        "2html_plugin",         -- Convierte buffers a HTML
        "tohtml",               -- Similar al anterior
        "getscript", "getscriptPlugin",
        "gzip",                 -- Manejo de archivos .gz
        "logipat",
        "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", -- Reemplazado por nvim-tree
        "matchit",              -- Mejora el %
        "tar", "tarPlugin",
        "rrhelper",
        "spellfile_plugin",     -- Ortografía de Vim
        "vimball", "vimballPlugin",
        "zip", "zipPlugin",
        "tutor",                -- Tutor de Vim
        "rplugin",
        "syntax", "synmenu",    -- Sintaxis básica
        "optwin", "compiler", "bugreport", "ftplugin"
      },
    },
  },
}
