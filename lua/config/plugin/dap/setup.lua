local dap = require("dap")
local dv = require("dap-view")

dap.listeners.before.attach["dap-view-config"] = dv.open
dap.listeners.before.launch["dap-view-config"] = dv.open
dap.listeners.before.event_terminated["dap-view-config"] = dv.close
dap.listeners.before.event_exited["dap-view-config"] = dv.close

-- DAP signs configuration
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Debug", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "Debug", linehl = "", numhl = "" })
vim.fn.sign_define("`DapBreakpointRejected`", { text = "󰅙", texthl = "Identifier", linehl = "", numhl = "" })
