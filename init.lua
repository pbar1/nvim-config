-- Enable Lua module caching if available for a speed boost
local ok, impatient = pcall(require, "impatient")
if ok then
   impatient.enable_profile()
end

-- Load configuration
require("config.options")
require("config.notify")
require("config.theme")
require("config.treesitter")
require("config.lsp")
require("config.dap")
require("config.completion")
require("config.telescope")
require("config.editor")
require("config.statusline")
require("config.keybinds")

-- FIXME: Maybe make a "languages" or "other" file for this
require("rust-tools").setup({})
