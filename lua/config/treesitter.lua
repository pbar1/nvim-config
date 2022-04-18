local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
   -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages

   highlight = { enable = true },

   -- Disabled for now as it's still pretty buggy in Go
   indent = { enable = false },

   -- FIXME: Integrate theme colors
   rainbow = { enable = false },
})
