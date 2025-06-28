local dap = require("dap")
local dv = require("dap-view")

dap.listeners.before.attach["dap-view-config"] = function()
  dv.open()
end

dap.listeners.before.launch["dap-view-config"] = function()
  dv.open()
end

dap.listeners.before.event_terminated["dap-view-config"] = function()
  dv.close()
end

dap.listeners.before.event_exited["dap-view-config"] = function()
  dv.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Debug", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "Debug", linehl = "", numhl = "" })
vim.fn.sign_define("`DapBreakpointRejected`", { text = "󰅙", texthl = "Identifier", linehl = "", numhl = "" })
