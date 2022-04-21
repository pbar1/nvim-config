local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
   vim.notify("nvim-dap not found. Debug Adapter Protocol (DAP) is disabled.", "warn")
   return
end

local dapui_ok, dapui = pcall(require, "dapui")
if dapui_ok then
   dapui.setup()
   dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
   end
   dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
   end
   dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
   end
else
   vim.notify("nvim-dap-ui not found. DAP UI is disabled.", "warn")
end

local dap_go_ok, dap_go = pcall(require, "dap-go")
if dap_go_ok then
   dap_go.setup()
else
   vim.notify("dap-go not found. Deubg support for Go is disabled.", "warn")
end

local dap_python_ok, dap_python = pcall(require, "dap-python")
if dap_python_ok then
   dap_python.setup("python")
else
   vim.notify("dap-python not found. Debug support for Python is disabled.", "warn")
end
