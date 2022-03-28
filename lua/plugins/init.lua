local packer = require("packer")

-- Initialize Packer
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

use({
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		require("plugins.treesitter")
	end,
})
use("p00f/nvim-ts-rainbow")

use({
	"neovim/nvim-lspconfig",
	config = function()
		require("plugins.lspconfig")
	end,
})

use({
	"catppuccin/nvim",
	as = "catppuccin",
	config = function()
		require("plugins.catppuccin")
	end,
})

use({
	"nvim-lualine/lualine.nvim",
	requires = { "kyazdani42/nvim-web-devicons", opt = true },
	config = function()
		require("plugins.lualine")
	end,
})
