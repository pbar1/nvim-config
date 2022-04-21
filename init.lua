-- Enable Lua module caching if available for a speed boost
local ok, impatient = pcall(require, "impatient")
if ok then
   impatient.enable_profile()
else
   vim.notify("impatient.nvim not found. Lua module caching is disabled.", "warn")
end

-- TODO: Check a global variable and save some time not looping here
-- Check if Nix is managing Vim packages. If not, load them with Packer.
-- local nix_packages = false
-- local re = vim.regex("^/nix/store/[a-zA-Z0-9]{32}-vim-pack-dir$")
-- for _, path in ipairs(vim.opt.packpath:get()) do
--    if re:match_str(path) then
--       nix_packages = true
--       break
--    end
-- end
--
-- if not nix_packages then
--    require("config.packer")
-- end

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
