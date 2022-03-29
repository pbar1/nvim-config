local lspconfig = require("lspconfig")

local servers = {
	"rust_analyzer",
	"gopls",
	"pyright",
}

for _, lsp in pairs(servers) do
	lspconfig[lsp].setup({
		flags = {
			-- This will be the default in neovim 0.7+
			debounce_text_changes = 150,
		},
	})
end

lspconfig["sumneko_lua"].setup({
	debounce_text_changes = 150,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = { enable = false },
		},
	},
})
