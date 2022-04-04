local gitsigns = require("gitsigns")
local indent_blankline = require("indent_blankline")
local comment = require("Comment")

gitsigns.setup()

indent_blankline.setup({
   show_current_context = true,
   show_current_context_start = true,
   filetype_exclude = { "alpha" },
})

comment.setup()
