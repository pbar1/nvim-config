-- Persistent undo history
-- FIXME: Make this directory if it doesn't exist
local undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true
vim.opt.undodir = undodir

-- Mouse mode
vim.opt.mouse = "a"

-- Share clipboard with system
vim.opt.clipboard:append("unnamedplus")

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable break indent
vim.o.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Must be set to stop nvim-notify spam
vim.opt.termguicolors = true

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
