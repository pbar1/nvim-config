local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local gitsigns = require("gitsigns")
local indentscope = require("mini.indentscope")
local comment = require("mini.comment")
local tabline = require("mini.tabline")
local autopairs = require("mini.pairs")
local cursorword = require("mini.cursorword")
local neo_tree = require("neo-tree")

dashboard.section.header.val = {
   "              ⣀⣠⣤⣴⣶⣶⣶⣾⣿⣿⣷⣶⣶⣶⣦⣤⣄⣀              ",
   "          ⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄          ",
   "       ⣠⣴⣿⣿⣿⣿⣿⡿⢿⣛⣯⣭⣷⣶⣶⣶⣶⣶⣶⣾⣭⣽⣛⡿⢿⣿⣿⣿⣿⣿⣦⣄       ",
   "     ⣠⣾⣿⣿⣿⣿⢿⣫⣵⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣝⡻⣿⣿⣿⣿⣷⣄     ",
   "   ⢠⣾⣿⣿⣿⣿⢟⣵⣿⣿⣿⣿⣿⠿⣛⣯⣭⣿⣶⣶⣶⣶⣿⣭⣽⣛⠿⣿⣿⣿⣿⣿⣮⡛⢿⣿⣿⣿⣷⡄   ",
   "  ⣰⣿⣿⣿⣿⢟⣵⠟⢋⣿⣿⠿⣫⣶⣿⣿⣿⣿⣿⣿⠿⠛⠛⠿⣿⣿⣿⣿⣶⣝⡻⣿⣿⣿⣿⣮⡻⣿⣿⣿⣿⣆  ",
   " ⢰⣿⣿⣿⣿⢯⣾⣿    ⢻⣿⣿⣿⣿⣿⣿⣿⠁  ⠙⣿⣿⣿⣿⣿⣿⣿⡟    ⠙⣷⡽⣿⣿⣿⣿⣆ ",
   "⢀⣿⣿⣿⣿⣏⣾⣿⣿⣷⡄⣀⣠⣾⣿⣿⣿⣿⢟⣽⣶⣦⣀⣀⣴⣶⣯⣛⢿⣿⣿⣿⣷⣄⣀⢠⣾⣧⣿⣿⣹⣿⣿⣿⣿⡀",
   "⢸⣿⣿⣿⣿⢸⣿⣿⣿⣿⢹⣿⣿⣿⣿⣿⡟⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢻⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿⡇⣿⣿⣿⣿⡇",
   "⢸⣿⣿⣿⣿⢼⣿⣿⣿⡏⣿⣿⣿⣿⣿⣿⣧⣿⣿⣿⣿⡏  ⢹⣿⣿⣿⣿⣎⣿⣿⣿⣿⣿⣿⢹⣿⣿⣿⣿⣻⣿⣿⣿⡇",
   "⢸⣿⣿⣿⣿⢸⣿⣿⣿⣿⢹⣿⣿⣟⠻⡟⠁⠉⠙⢿⣿⣿⣶⣶⣿⣿⡿⠋⠁⠈⠛⣿⣿⣿⣿⡟⣿⣿⣿⣿⡏⣿⣿⣿⣿⡇",
   "⠘⣿⣿⣿⣿⡞⣿⣿⣿⣿⣏⢿⣿⣿⣄⡀  ⣀⢾⣿⣿⣿⣿⣿⣿⡷⣀⣀⡀ ⣸⣿⣿⣿⣱⣿⣿⣿⣿⢳⣿⣿⣿⣿⠃",
   " ⢹⣿⣿⣿⣿⡼⣿⣿⣿⣿⣮⣻⣿⣿⣿⣿⣿⣿⣿⣶⣯⣭⣭⣽⣷⣿⣿⣟⣥⣶⣿⣿⡿⣵⣿⣿⣿⣿⢯⣿⣿⣿⣿⡟ ",
   "  ⢻⣿⣿⣿⣿⣜⢿⣿⣿⣿⣷⣍⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣫⣾⣿⣿⣿⡿⣫⣿⣿⣿⣿⡟  ",
   "   ⠹⣿⣿⣿⣿⣷⣝⢿⣿⣿⣿⣿⣶⣭⣛⡿⠿⣿⠟⠛⠛⠻⣿⡿⢿⣛⣯⣶⣿⣿⣿⣿⡿⢛⣼⣿⣿⣿⣿⠏   ",
   "    ⠈⠻⣿⣿⣿⣿⣷⣽⡻⣿⣿⣿⣿⣿⣿⣿⣿⣄  ⢀⣾⣿⣿⣿⣿⣿⣿⣿⢟⣫⣾⣿⣿⣿⣿⠟⠁    ",
   "      ⠈⠻⢿⣿⣿⣿⣿⣷⣯⣽⣻⡿⢿⣷⣦⣤⣤⣴⣿⣿⣿⡿⢿⣟⣫⣽⣾⣿⣿⣿⣿⣿⠟⠁      ",
   "         ⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋         ",
   "            ⠈⠉⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠛⠉⠁            ",
   "                     ⠉⠉⠉⠉                     ",
}
alpha.setup(dashboard.config)

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

cursorword.setup()

neo_tree.setup()
