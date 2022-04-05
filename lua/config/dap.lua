local dap = require("dap")
local dapui = require("dapui")
local dap_go = require("dap-go")
local dap_python = require("dap-python")

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

dap_go.setup()

dap_python.setup("python")
