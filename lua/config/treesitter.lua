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

-- FIXME: Associate filetypes with syntax in a more generic way
local ok, treesitter_parsers = pcall(require, "nvim-treesitter.parsers")
if ok then
   treesitter_parsers.filetype_to_parsername.tf = "hcl"
else
   vim.notify("nvim-treesitter.parsers not found. Unable to associate custom filetypes with syntax.", "warn")
end

local ok, spellsitter = pcall(require, "spellsitter")
if ok then
   spellsitter.setup()
else
   vim.notify("spellsitter.nvim not found. Tree-sitter spelling integration is disabled.", "warn")
end
