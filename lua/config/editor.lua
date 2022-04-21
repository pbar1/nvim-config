local alpha_ok, alpha = pcall(require, "alpha")
if alpha_ok then
   local dashboard = require("alpha.themes.dashboard")

   dashboard.section.header.val = {
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣶⣶⣶⣾⣿⣿⣿⣿⣷⣶⣶⣶⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⡿⢿⣛⣭⣽⣶⣶⣿⣿⣿⣿⣿⣿⣶⣶⣯⣭⣛⡻⢿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⡿⣛⣵⣾⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣷⣮⣛⢿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀",
      "⠀⠀⠀⣰⣿⣿⣿⣿⠟⣩⣾⠿⣿⣿⣿⠿⣛⣭⣷⣶⣿⣿⣿⣿⣿⣿⣶⣾⣭⣛⠿⣿⣿⣿⣿⣷⣌⠻⣿⣿⣿⣿⣆⠀⠀⠀",
      "⠀⠀⣼⣿⣿⣿⡿⢫⣾⠋⠠⠿⠿⣫⣵⣿⣿⣿⣿⣿⣿⡟⠋⠉⢉⣙⣻⣿⣿⣿⣿⣶⣝⠿⠟⠛⠿⣷⣝⢿⣿⣿⣿⣧⠀⠀",
      "⠀⣸⣿⣿⣿⡿⣱⣿⣿⡀⠀⠀⠀⢸⣿⣿⣿⣿⣿⡿⣟⠀⠀⠀⠀⣻⠿⣿⣿⣿⣿⣿⡇⠀⠀⠀⢠⡈⣿⣎⢿⣿⣿⣿⣧⠀",
      "⢠⣿⣿⣿⣿⢣⣿⣿⣿⣿⢆⣶⣶⣿⣿⣿⣿⢟⣵⣿⣿⣷⣶⣶⣾⣿⣿⣮⡻⣿⣿⣿⣿⣷⣶⡔⣿⣷⣿⣿⡜⣿⣿⣿⣿⡄",
      "⢸⣿⣿⣿⣿⢸⣿⣿⣿⡿⣸⣿⣿⣿⣿⣿⡏⣾⣿⣿⣿⡿⠛⠛⢿⣿⣿⣿⣿⡸⣿⣿⣿⣿⣿⣧⢻⣿⣿⣿⣇⣿⣿⣿⣿⡇",
      "⢸⣿⣿⣿⣿⢸⣿⣿⣿⣧⢻⣿⣿⡿⣿⣿⠏⠛⠿⣿⣿⣧⣀⣀⣼⣿⣿⠿⠛⠡⢿⣿⣿⣿⣿⡿⣸⣿⣿⣿⡟⣼⣿⣿⣿⡇",
      "⠸⣿⣿⣿⣿⡸⣿⣿⣿⣿⡼⣿⣿⣷⡈⠁⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣏⠀⠀⠀⠀⢻⣿⣿⣿⢇⣿⣿⣿⣿⢇⣿⣿⣿⣿⡇",
      "⠀⢻⣿⣿⣿⣧⢻⣿⣿⣿⣷⡝⣿⣿⣿⣶⣶⣶⣶⣯⣟⣛⣿⣿⣛⣻⣭⣶⣶⠆⣠⣾⣿⣿⢏⣾⣿⣿⣿⡟⣼⣿⣿⣿⡿⠀",
      "⠀⠈⢿⣿⣿⣿⣧⡻⣿⣿⣿⣿⣮⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣵⣿⣿⣿⣿⢟⣼⣿⣿⣿⡿⠁⠀",
      "⠀⠀⠈⢻⣿⣿⣿⣿⣎⠻⣿⣿⣿⣿⣷⣭⣛⠿⣿⣿⣿⡿⠿⠿⢿⣿⣿⣿⠿⣟⣯⣶⣿⣿⣿⣿⠿⣣⣿⣿⣿⣿⡟⠁⠀⠀",
      "⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣮⣛⢿⣿⣿⣿⣿⣿⣷⣶⣿⡀⠀⠀⠀⣽⣶⣾⣿⣿⣿⣿⣿⡿⣟⣵⣾⣿⣿⣿⡿⠋⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣷⣮⣽⣛⠿⢿⣿⣿⣭⣉⣀⣤⣾⣿⣿⣿⡿⠿⣛⣯⣵⣾⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⢿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣯⣭⣭⣽⣿⣶⣶⣿⣿⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
   }

   alpha.setup(dashboard.config)
else
   vim.notify("alpha.nvim not found. Start screen is disabled.", "warn")
end

local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
if nvim_tree_ok then
   nvim_tree.setup()
else
   vim.notify("nvim_tree not found. File browser is disabled.", "warn")
end

local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if gitsigns_ok then
   gitsigns.setup()
else
   vim.notify("gitsigns not found. Git change markings are disabled.", "warn")
end

local indentscope_ok, indentscope = pcall(require, "mini.indentscope")
if indentscope_ok then
   indentscope.setup({
      draw = {
         animation = indentscope.gen_animation("none"),
      },
   })
else
   vim.notify("indentscope not found. Indent scope markings are disabled.", "warn")
end

local comment_ok, comment = pcall(require, "mini.comment")
if comment_ok then
   comment.setup()
else
   vim.notify("comment not found. Comment enhancements are disabled.", "warn")
end

local pairs_ok, pairs = pcall(require, "mini.pairs")
if pairs_ok then
   pairs.setup({
      modes = { command = true },
   })
else
   vim.notify("pairs not found. Automatic paired-characters are disabled.", "warn")
end

local cursorword_ok, cursorword = pcall(require, "mini.cursorword")
if cursorword_ok then
   cursorword.setup()
else
   vim.notify("cursorword not found. Current word underlining is disabled.", "warn")
end

local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if toggleterm_ok then
   toggleterm.setup()
else
   vim.notify("toggleterm not found. Togging builtin terminal is disabled.", "warn")
end

local lightspeed_ok, lightspeed = pcall(require, "lightspeed")
if lightspeed_ok then
   lightspeed.setup({})
else
   vim.notify("lightspeed not found. Fast motion is disabled.", "warn")
end
