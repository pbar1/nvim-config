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
	"hrsh7th/nvim-cmp",
	config = function()
		require("plugins.completion")
	end,
})
use("hrsh7th/cmp-nvim-lsp")
use("L3MON4D3/LuaSnip")
use("saadparwaiz1/cmp_luasnip")

use({
	"catppuccin/nvim",
	as = "catppuccin",
	config = function()
		require("plugins.catppuccin")
	end,
})

use({
	"echasnovski/mini.nvim",
	config = function()
		require("plugins.mini")
	end,
})

use({
	"nvim-lualine/lualine.nvim",
	requires = { "kyazdani42/nvim-web-devicons", opt = true },
	config = function()
		require("plugins.lualine")
	end,
})

use({
	"nvim-telescope/telescope.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		require("plugins.telescope")
	end,
})
use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

use({
	"rcarriga/nvim-notify",
	config = function()
		require("plugins.notify")
	end,
})

use({
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("plugins.indent-blankline")
	end,
})

use({
	"lewis6991/gitsigns.nvim",
	config = function()
		require("plugins.gitsigns")
	end,
})

use("jeffkreeftmeijer/vim-numbertoggle")

-- TODO: Write "use_with_config" wrapper
-- Parse package owner and repo into words. Take unique words from repo,
-- excluding "neovim" and "nvim". If this result is empty, do the same for
-- the owner. Finally, append "plugins." before the result and require it.
