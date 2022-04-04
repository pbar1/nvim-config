local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
   ensure_installed = "maintained",

   highlight = { enable = true },

   -- Disabled for now as it's still pretty buggy in Go
   indent = { enable = false },

   -- FIXME: Integrate theme colors
   rainbow = { enable = false },
})
