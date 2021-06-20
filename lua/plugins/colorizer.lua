local M = {}

M.filetypes = {
    "css",
    "scss",
    "sass",
    "dosini",
    "json",
}

function M.config()
    require("colorizer").setup(M.filetypes, {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
    })
end

return M
