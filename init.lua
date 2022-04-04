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

-- Load plugins
local use = packer.use

use("wbthomason/packer.nvim")
use({ "catppuccin/nvim", as = "catppuccin" })
use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
use("p00f/nvim-ts-rainbow")
use("neovim/nvim-lspconfig")
use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
use("hrsh7th/nvim-cmp")
use("hrsh7th/cmp-nvim-lsp")
use("L3MON4D3/LuaSnip")
use("saadparwaiz1/cmp_luasnip")
use("github/copilot.vim")
use("goolord/alpha-nvim")
use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
use("folke/which-key.nvim")
use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
use("rcarriga/nvim-notify")
use("jeffkreeftmeijer/vim-numbertoggle")
use("lewis6991/gitsigns.nvim")
use("lukas-reineke/indent-blankline.nvim")
use("farmergreg/vim-lastplace")

-- Load configuration
require("config.options")
require("config.theme")
require("config.treesitter")
require("config.lsp")
require("config.completion")
require("config.dashboard")
require("config.statusline")
require("config.keybinds")
require("config.telescope")
require("config.notify")
require("config.editor")
