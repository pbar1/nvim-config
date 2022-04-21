local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
   vim.notify("nvim-lspconfig not found. LSP is disabled.", "warn")
   return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_nvim_lsp_ok then
   capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
else
   vim.notify("cmp-nvim-lsp not found. LSP completion is disabled.", "warn")
end

local lsp_signature_ok, lsp_signature = pcall(require, "lsp_signature")
if lsp_signature_ok then
   lsp_signature.setup({})
else
   vim.notify("lsp_signature.nvim not found. Function signature popups are disabled.", "warn")
end

local which_key_ok, which_key = pcall(require, "which-key")
local on_attach = function(client, bufnr)
   -- Disable LSP formatting in favor of null-ls
   -- WARNING: Make sure not to run this on **null-ls** itself!
   client.resolved_capabilities.document_formatting = false
   client.resolved_capabilities.document_range_formatting = false

   -- TODO: Move into keybinds module if it can be designed cleanly
   if which_key_ok then
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
end

-- List of predefined LSP server configs:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
local lsp_servers = {
   "gopls",
   "pyright",
   "bashls",
   "terraformls",
   "rnix",
}

for _, lsp in pairs(lsp_servers) do
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

local nvim_pid = vim.fn.getpid()
local omnisharp_bin = vim.env.OMNISHARP_BIN
if not omnisharp_bin == "" then
   lspconfig["omnisharp"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(nvim_pid) },
   })
else
   vim.notify("OMNISHARP_BIN not found. OmniSharp LSP (C#) is disabled.", "warn")
end

local rust_tools_ok, rust_tools = pcall(require, "rust-tools")
if rust_tools_ok then
   local adapter = {}

   -- Use vscode-lldb for better debugging support
   -- https://github.com/simrat39/rust-tools.nvim#a-better-debugging-experience
   if not vim.env.VSCODE_LLDB_PATH == "" then
      local liblldb_ext = ".so"
      if vim.loop.os_uname().sysname == "Darwin" then
         liblldb_ext = ".dylib"
      end
      local codelldb_path = vim.env.VSCODE_LLDB_PATH .. "/adapter/codelldb"
      local liblldb_path = vim.env.VSCODE_LLDB_PATH .. "/lldb/lib/liblldb" .. liblldb_ext

      local rust_tools_dap = require("rust-tools.dap")
      adapter = rust_tools_dap.get_codelldb_adapter(codelldb_path, liblldb_path)
   end

   rust_tools.setup({
      server = {
         on_attach = on_attach,
         capabilities = capabilities,
      },

      dap = {
         adapter = adapter,
      },
   })
else
   vim.notify("rust-tools.nvim not found. Rust language support is disabled.", "warn")
end

local null_ls_ok, null_ls = pcall(require, "null-ls")
if null_ls_ok then
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
else
   vim.notify("null-ls.nvim not found. External formatting and diagnistics are disabled.", "warn")
end
