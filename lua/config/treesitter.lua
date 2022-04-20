local treesitter_configs = require("nvim-treesitter.configs")
local spellsitter = require("spellsitter")

treesitter_configs.setup({
   highlight = { enable = true },

   -- Disabled for now as it's still pretty buggy in Go
   indent = { enable = false },

   -- FIXME: Integrate theme colors
   rainbow = { enable = false },
})

spellsitter.setup()
