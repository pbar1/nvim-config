local ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not ok then
   vim.notify("nvim-treesitter.configs not found. Tree-sitter integration is disabled.", "error")
   return
end

treesitter_configs.setup({
   highlight = { enable = true },

   -- Disabled for now as it's still pretty buggy in Go
   indent = { enable = false },

   -- TODO: Integrate theme colors
   rainbow = { enable = false },
})

-- TODO: Associate filetypes with syntax in a more generic way
local parsers = require("nvim-treesitter.parsers")
parsers.filetype_to_parsername.tf = "hcl"

local ok, spellsitter = pcall(require, "spellsitter")
if ok then
   spellsitter.setup()
else
   vim.notify("spellsitter.nvim not found. Tree-sitter spelling integration is disabled.", "warn")
end
