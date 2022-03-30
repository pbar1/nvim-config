local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = "maintained",

	highlight = {
		enable = true,
	},

	-- Disabled for now as it's still pretty buggy in Go
	indent = {
		enable = false,
	},

	-- FIXME: Integrate theme colors
	rainbow = {
		enable = false,
	},
})
