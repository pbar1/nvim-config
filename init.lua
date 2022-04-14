-------------------------------------------------------------------------------
-- Inspiration:
--   https://github.com/NvChad/NvChad/blob/main/init.lua
--   https://github.com/numToStr/dotfiles/blob/master/neovim/.config/nvim/lua/numToStr/plugins.lua
--   https://github.com/CosmicNvim/CosmicNvim/blob/main/lua/cosmic/core/pluginsInit.lua
-------------------------------------------------------------------------------

-- Enable Lua module caching if available for a speed boost
local ok, impatient = pcall(require, "impatient")
if ok then
   impatient.enable_profile()
end

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
use({ "lewis6991/impatient.nvim" })
use({ "nathom/filetype.nvim" })
use({ "MunifTanjim/nui.nvim" })
use({ "rcarriga/nvim-notify" })
use({ "tpope/vim-repeat" })
use({ "dstein64/vim-startuptime" })
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
use({ "mfussenegger/nvim-dap" }) -- TODO: BufWinEnter
use({ "rcarriga/nvim-dap-ui" })
use({ "leoluz/nvim-dap-go" })
use({ "mfussenegger/nvim-dap-python" })
-- Completion -----------------------------------------------------------------
use({ "hrsh7th/nvim-cmp" }) -- TODO: InsertEnter
use({ "hrsh7th/cmp-nvim-lsp" })
use({ "L3MON4D3/LuaSnip" })
use({ "saadparwaiz1/cmp_luasnip" })
use({ "github/copilot.vim", disable = true })
-- Telescope ------------------------------------------------------------------
use({ "nvim-telescope/telescope.nvim" })
use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
-- UI & Editor ----------------------------------------------------------------
use({ "echasnovski/mini.nvim" })
use({ "goolord/alpha-nvim" })
use({ "romgrk/barbar.nvim" })
use({ "kyazdani42/nvim-tree.lua" })
use({ "nvim-lualine/lualine.nvim" })
use({ "jeffkreeftmeijer/vim-numbertoggle" })
use({ "lewis6991/gitsigns.nvim" })
use({ "farmergreg/vim-lastplace" })
use({ "editorconfig/editorconfig-vim" })
use({ "tpope/vim-surround" })
-- Keybinds & Actions ---------------------------------------------------------
use({ "folke/which-key.nvim" })
use({ "ggandor/lightspeed.nvim" })

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
