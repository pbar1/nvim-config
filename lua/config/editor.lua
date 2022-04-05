local gitsigns = require("gitsigns")
local mini_indentscope = require("mini.indentscope")
local mini_comment = require("mini.comment")
local mini_tabline = require("mini.tabline")

gitsigns.setup()

mini_indentscope.setup({
   draw = {
      animation = mini_indentscope.gen_animation("none"),
   },
})

mini_comment.setup()

mini_tabline.setup()
