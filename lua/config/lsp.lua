local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lsp_signature = require("lsp_signature")
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local rust_tools = require("rust-tools")
local rust_tools_dap = require("rust-tools.dap")
local which_key = require("which-key")

-- Add completion to LSP capabilities
local caps_orig = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.update_capabilities(caps_orig)

-- Get current Neovim process PID for use with some LSP servers
local pid = vim.fn.getpid()

lsp_signature.setup({})

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

-- FIXME: More robust logic here
-- Use vscode-lldb for better debugging support
-- https://github.com/simrat39/rust-tools.nvim#a-better-debugging-experience
local liblldb_ext = ""
if vim.loop.os_uname().sysname == "Darwin" then
   liblldb_ext = ".dylib"
else
   liblldb_ext = ".so"
end
local codelldb_path = vim.env.VSCODE_LLDB_PATH .. "/adapter/codelldb"
local liblldb_path = vim.env.VSCODE_LLDB_PATH .. "/lldb/lib/liblldb" .. liblldb_ext

rust_tools.setup({
   server = {
      on_attach = on_attach,
      capabilities = capabilities,
   },

   dap = {
      adapter = rust_tools_dap.get_codelldb_adapter(codelldb_path, liblldb_path),
   },
})

-- Configure formatters, linters, and diagnostic tools with null-ls
null_ls.setup({
   sources = {
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.nixpkgs_fmt,
      null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.diagnostics.statix,
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
