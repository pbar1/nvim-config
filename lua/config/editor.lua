local gitsigns = require("gitsigns")
local indentscope = require("mini.indentscope")
local comment = require("mini.comment")
local tabline = require("mini.tabline")
local autopairs = require("mini.pairs")
-- local sessions = require("mini.sessions") FIXME: Get sessions working
local starter = require("mini.starter")
local cursorword = require("mini.cursorword")
local neo_tree = require("neo-tree")

gitsigns.setup()

indentscope.setup({
   draw = {
      animation = indentscope.gen_animation("none"),
   },
})

comment.setup()

tabline.setup()

autopairs.setup({
   modes = { command = true },
})

-- sessions.setup({
--    autoread = true,
-- })

starter.setup({
   items = {
      starter.sections.telescope(),
   },
   header = [[
              ⣀⣠⣤⣴⣶⣶⣶⣾⣿⣿⣷⣶⣶⣶⣦⣤⣄⣀
          ⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄
       ⣠⣴⣿⣿⣿⣿⣿⡿⢿⣛⣯⣭⣷⣶⣶⣶⣶⣶⣶⣾⣭⣽⣛⡿⢿⣿⣿⣿⣿⣿⣦⣄
     ⣠⣾⣿⣿⣿⣿⢿⣫⣵⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣝⡻⣿⣿⣿⣿⣷⣄
   ⢠⣾⣿⣿⣿⣿⢟⣵⣿⣿⣿⣿⣿⠿⣛⣯⣭⣿⣶⣶⣶⣶⣿⣭⣽⣛⠿⣿⣿⣿⣿⣿⣮⡛⢿⣿⣿⣿⣷⡄
  ⣰⣿⣿⣿⣿⢟⣵⠟⢋⣿⣿⠿⣫⣶⣿⣿⣿⣿⣿⣿⠿⠛⠛⠿⣿⣿⣿⣿⣶⣝⡻⣿⣿⣿⣿⣮⡻⣿⣿⣿⣿⣆
 ⢰⣿⣿⣿⣿⢯⣾⣿    ⢻⣿⣿⣿⣿⣿⣿⣿⠁  ⠙⣿⣿⣿⣿⣿⣿⣿⡟    ⠙⣷⡽⣿⣿⣿⣿⣆
⢀⣿⣿⣿⣿⣏⣾⣿⣿⣷⡄⣀⣠⣾⣿⣿⣿⣿⢟⣽⣶⣦⣀⣀⣴⣶⣯⣛⢿⣿⣿⣿⣷⣄⣀⢠⣾⣧⣿⣿⣹⣿⣿⣿⣿⡀
⢸⣿⣿⣿⣿⢸⣿⣿⣿⣿⢹⣿⣿⣿⣿⣿⡟⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢻⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿⡇⣿⣿⣿⣿⡇
⢸⣿⣿⣿⣿⢼⣿⣿⣿⡏⣿⣿⣿⣿⣿⣿⣧⣿⣿⣿⣿⡏  ⢹⣿⣿⣿⣿⣎⣿⣿⣿⣿⣿⣿⢹⣿⣿⣿⣿⣻⣿⣿⣿⡇
⢸⣿⣿⣿⣿⢸⣿⣿⣿⣿⢹⣿⣿⣟⠻⡟⠁⠉⠙⢿⣿⣿⣶⣶⣿⣿⡿⠋⠁⠈⠛⣿⣿⣿⣿⡟⣿⣿⣿⣿⡏⣿⣿⣿⣿⡇
⠘⣿⣿⣿⣿⡞⣿⣿⣿⣿⣏⢿⣿⣿⣄⡀  ⣀⢾⣿⣿⣿⣿⣿⣿⡷⣀⣀⡀ ⣸⣿⣿⣿⣱⣿⣿⣿⣿⢳⣿⣿⣿⣿⠃
 ⢹⣿⣿⣿⣿⡼⣿⣿⣿⣿⣮⣻⣿⣿⣿⣿⣿⣿⣿⣶⣯⣭⣭⣽⣷⣿⣿⣟⣥⣶⣿⣿⡿⣵⣿⣿⣿⣿⢯⣿⣿⣿⣿⡟
  ⢻⣿⣿⣿⣿⣜⢿⣿⣿⣿⣷⣍⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣫⣾⣿⣿⣿⡿⣫⣿⣿⣿⣿⡟
   ⠹⣿⣿⣿⣿⣷⣝⢿⣿⣿⣿⣿⣶⣭⣛⡿⠿⣿⠟⠛⠛⠻⣿⡿⢿⣛⣯⣶⣿⣿⣿⣿⡿⢛⣼⣿⣿⣿⣿⠏
    ⠈⠻⣿⣿⣿⣿⣷⣽⡻⣿⣿⣿⣿⣿⣿⣿⣿⣄  ⢀⣾⣿⣿⣿⣿⣿⣿⣿⢟⣫⣾⣿⣿⣿⣿⠟⠁
      ⠈⠻⢿⣿⣿⣿⣿⣷⣯⣽⣻⡿⢿⣷⣦⣤⣤⣴⣿⣿⣿⡿⢿⣟⣫⣽⣾⣿⣿⣿⣿⣿⠟⠁
         ⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋
            ⠈⠉⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠛⠉⠁
   ]],
   content_hooks = {
      starter.gen_hook.adding_bullet(),
      starter.gen_hook.aligning("center", "center"),
   },
})

cursorword.setup()

neo_tree.setup()
