local catppuccin = require("catppuccin")

catppuccin.setup({
   neotree = { enabled = true },
   which_key = true,
   barbar = true,
   ts_rainbow = true,
})

vim.cmd("colorscheme catppuccin")
