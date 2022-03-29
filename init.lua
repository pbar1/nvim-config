local fn = vim.fn

-- Install Packer if needed
local packer_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(packer_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path })
end

-- Load plugins
require("plugins")

-- Load general Neovim editor configuration
require("config")
