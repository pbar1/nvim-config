local catppuccin = require("catppuccin")

catppuccin.setup({
   transparent_background = true,
   term_colors = true,
   intrgrations = {
      neotree = { enabled = true },
      which_key = true,
      barbar = true,
      ts_rainbow = true,
      lightspeed = true,
   },
})

vim.cmd("colorscheme catppuccin")
