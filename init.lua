-- Install Packer if needed
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
   vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path })
end

-- Initialize Packer
local packer = require("packer")

packer.init({
   profile = {
      enable = false,
      threshold = 0,
   },
})

packer.reset()

local use = packer.use

-- Core -----------------------------------------------------------------------
use({ "wbthomason/packer.nvim" })
use({ "nvim-lua/plenary.nvim" })
-- Theme ----------------------------------------------------------------------
use({ "kyazdani42/nvim-web-devicons" })
use({ "catppuccin/nvim", as = "catppuccin" })
-- TreeSitter -----------------------------------------------------------------
use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
use({ "p00f/nvim-ts-rainbow" })
-- Language Server Protocol (LSP) ---------------------------------------------
use({ "neovim/nvim-lspconfig" })
use({ "jose-elias-alvarez/null-ls.nvim" })
-- Debug Adapter Protocol (DAP) -----------------------------------------------
use({ "mfussenegger/nvim-dap" })
use({ "rcarriga/nvim-dap-ui" })
use({ "leoluz/nvim-dap-go" })
-- Completion -----------------------------------------------------------------
use({ "hrsh7th/nvim-cmp" })
use({ "hrsh7th/cmp-nvim-lsp" })
use({ "L3MON4D3/LuaSnip" })
use({ "saadparwaiz1/cmp_luasnip" })
use({ "github/copilot.vim" })
-- Telescope ------------------------------------------------------------------
use({ "nvim-telescope/telescope.nvim" })
use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
-- UI & Editor ----------------------------------------------------------------
use({ "echasnovski/mini.nvim" })
use({ "nvim-lualine/lualine.nvim" })
use({ "rcarriga/nvim-notify" })
use({ "jeffkreeftmeijer/vim-numbertoggle" })
use({ "lewis6991/gitsigns.nvim" })
use({ "farmergreg/vim-lastplace" })
-- Keybinds & Actions ---------------------------------------------------------
use({ "folke/which-key.nvim" })

-- Load configuration
require("config.options")
require("config.theme")
require("config.treesitter")
require("config.lsp")
require("config.dap")
require("config.completion")
require("config.telescope")
require("config.editor")
require("config.statusline")
require("config.notify")
require("config.keybinds")
