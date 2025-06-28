local dap = require("dap")

vim.keymap.set("n", "<F9>", dap.continue, { desc = "DAP: Continue executing a paused session or start a new one" })
vim.keymap.set("n", "<F10>", dap.toggle_breakpoint, { desc = "DAP: Set or remove a breakpoint at the current line" })
vim.keymap.set("n", "<F11>", dap.step_out, { desc = "DAP: Step out of the current scope" })
vim.keymap.set("n", "<F12>", dap.step_into, { desc = "DAP: Step into the current expression" })
