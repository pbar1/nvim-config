local lualine = require("lualine")

lualine.setup({
	options = {
		theme = "catppuccin",
		component_separators = "|",
		section_separators = "",
		-- globalstatus = true, -- FIXME: Neovim 0.7+
	},

	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return str:sub(1, 3)
				end,
			},
		},

		lualine_b = {
			{
				"branch",
				icon = "",
			},
		},
	},
})
