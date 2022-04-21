local which_key_ok, which_key = pcall(require, "which-key")
if not which_key_ok then
   vim.notify("which-key not found. Custom keybinds are disabled.", "warn")
   return
end

-- Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

which_key.setup({
   key_labels = {
      ["<Leader>"] = "LDR",
      ["<Space>"] = "SPC",
      ["<CR>"] = "RET",
      ["<Tab>"] = "TAB",
      ["<Esc>"] = "ESC",
   },
})

local leader_mappings = {
   ["d"] = {
      name = "+debug 🐛",
      ["b"] = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint" },
      ["d"] = { "<cmd>lua require('dap').continue()<cr>", "Start or continue" },
      ["i"] = { "<cmd>lua require('dap').step_into()<cr>", "Step into" },
      ["o"] = { "<cmd>lua require('dap').step_out()<cr>", "Step out" },
      ["n"] = { "<cmd>lua require('dap').step_over()<cr>", "Step over" },
      ["p"] = { "<cmd>lua require('dap').step_back()<cr>", "Step back" },
      ["v"] = { "<cmd>lua require('dap').reverse_continue()<cr>", "Reverse continue" },
      ["r"] = { "<cmd>lua require('dap').restart()<cr>", "Restart debugger" },
      ["x"] = { "<cmd>lua require('dap').terminate()<cr>", "Stop debugger" },
      ["u"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle debug UI" },
   },
   ["f"] = {
      name = "+find 🔎",
      ["f"] = { "<cmd>Telescope find_files<cr>", "Find files" },
      ["g"] = { "<cmd>Telescope live_grep<cr>", "Live grep" },
      ["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
      ["h"] = { "<cmd>Telescope help_tags<cr>", "Help tags" },
      ["r"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      ["s"] = { "<cmd>SearchBoxIncSearch<cr>", "Find in file" },
   },
   ["t"] = {
      name = "+terminal 🖥️ ",
      ["t"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
   },
   ["P"] = {
      name = "+Packer 📦",
      ["c"] = { "<cmd>PackerCompile<cr>", "PackerCompile" },
      ["y"] = { "<cmd>PackerSync<cr>", "PackerSync" },
      ["p"] = { "<cmd>PackerProfile<cr>", "PackerProfile" },
   },
}
which_key.register(leader_mappings, { prefix = "<leader>" })
