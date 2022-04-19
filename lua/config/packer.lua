-- This is a GENERATED file. It was built using "task gen:packer"

local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
   vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path })
end

local packer = require("packer")
packer.init({
   profile = {
      enable = true,
      threshold = 0,
   },
})
packer.reset()

local use = packer.use
use({ "wbthomason/packer.nvim" })
use({ "L3MON4D3/LuaSnip" })
use({ "goolord/alpha-nvim" })
use({ "romgrk/barbar.nvim" })
use({ "catppuccin/nvim", as = "catppuccin" })
use({ "hrsh7th/cmp-nvim-lsp" })
use({ "saadparwaiz1/cmp_luasnip" })
use({ "github/copilot.vim" })
use({ "editorconfig/editorconfig-vim" })
use({ "nathom/filetype.nvim" })
use({ "lewis6991/gitsigns.nvim" })
use({ "lewis6991/impatient.nvim" })
use({ "ggandor/lightspeed.nvim" })
use({ "nvim-lualine/lualine.nvim" })
use({ "echasnovski/mini.nvim" })
use({ "MunifTanjim/nui.nvim" })
use({ "jose-elias-alvarez/null-ls.nvim" })
use({ "hrsh7th/nvim-cmp" })
use({ "mfussenegger/nvim-dap" })
use({ "leoluz/nvim-dap-go" })
use({ "mfussenegger/nvim-dap-python" })
use({ "rcarriga/nvim-dap-ui" })
use({ "neovim/nvim-lspconfig" })
use({ "rcarriga/nvim-notify" })
use({ "kyazdani42/nvim-tree.lua" })
use({ "kyazdani42/nvim-web-devicons" })
use({ "nvim-lua/plenary.nvim" })
use({ "nvim-telescope/telescope.nvim" })
use({ "akinsho/toggleterm.nvim" })
use({ "farmergreg/vim-lastplace" })
use({ "jeffkreeftmeijer/vim-numbertoggle" })
use({ "tpope/vim-repeat" })
use({ "dstein64/vim-startuptime" })
use({ "tpope/vim-surround" })
use({ "folke/which-key.nvim" })
