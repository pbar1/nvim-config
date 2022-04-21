-- Enable Lua module caching if available for a speed boost
local ok, impatient = pcall(require, "impatient")
if ok then
   impatient.enable_profile()
else
   vim.notify("impatient.nvim not found. Lua module caching is disabled.", "warn")
end

-- Check if Nix is managing Vim packages. If not, load them with Packer.
if not vim.env.NVIM_PBAR_PLUGINS then
   vim.notify("loading packer")
   require("config.packer")
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
