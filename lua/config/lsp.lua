local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local null_ls = require("null-ls")

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	"rust_analyzer",
	"gopls",
	"pyright",
	"bashls",
	"terraformls",
	"rnix",
}

for _, lsp in pairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
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

-- Configure formatters, linters, and diagnostic tools with null-ls
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.goimports, -- FIXME: Disable gopls formatting to avoid prompt
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua,
	},

	-- Format on save if supported
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
