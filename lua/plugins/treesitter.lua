local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = "maintained",

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},

	-- FIXME: Integrate theme colors
	rainbow = {
		enable = false,
	},
})
