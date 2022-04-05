local notify = require("notify")

vim.opt.termguicolors = true

notify.setup({
   -- Must be set to stop spam: https://github.com/rcarriga/nvim-notify/issues/69#issuecomment-1072975047
   background_colour = "#000000",
})

vim.notify = notify
