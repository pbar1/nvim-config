local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local null_ls = require("null-ls")
local which_key = require("which-key")

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
   -- Disable LSP formatting in favor of null-ls
   -- WARNING: Make sure not to run this on **null-ls** itself!
   client.resolved_capabilities.document_formatting = false
   client.resolved_capabilities.document_range_formatting = false

   -- TODO: Move into keybinds module if it can be designed cleanly
   which_key.register({
      ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
      ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
      ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>" },
      ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>" },
      ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
      ["<leader>wa"] = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" },
      ["<leader>wr"] = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" },
      ["<leader>wl"] = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" },
      ["<leader>D"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>" },
      ["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol" },
      ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>" },
      ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>" },
      ["<leader>f"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>" },
   }, { buffer = bufnr })
end

-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
local servers = {
   "rust_analyzer",
   "gopls",
   "pyright",
   "bashls",
   "terraformls",
   "rnix",
   "csharp_ls",
}

for _, lsp in pairs(servers) do
   lspconfig[lsp].setup({
      on_attach = on_attach,
      capabilities = capabilities,
   })
end

lspconfig["sumneko_lua"].setup({
   on_attach = on_attach,
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
      null_ls.builtins.formatting.nixpkgs_fmt,
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
