require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt" },
	check_ts = true,
	map_bs = true,
})

local ok, cmp = pcall(require, "cmp")
if ok then
	local autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", autopairs.on_confirm_done())
end
