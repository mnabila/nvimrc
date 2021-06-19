local default = {
    RGB = true,
    RRGGBB = true,
    names = false,
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true,
    mode = "background",
}
require("colorizer").setup({ "*" }, default)
