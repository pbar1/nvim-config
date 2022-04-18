local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local nvim_tree = require("nvim-tree")
local gitsigns = require("gitsigns")
local indentscope = require("mini.indentscope")
local comment = require("mini.comment")
local autopairs = require("mini.pairs")
local cursorword = require("mini.cursorword")
local toggleterm = require("toggleterm")
local terminal = require("toggleterm.terminal")

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

nvim_tree.setup()

gitsigns.setup()

indentscope.setup({
   draw = {
      animation = indentscope.gen_animation("none"),
   },
})

comment.setup()

autopairs.setup({
   modes = { command = true },
})

cursorword.setup()

toggleterm.setup()
