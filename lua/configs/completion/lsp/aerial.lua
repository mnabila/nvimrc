local options = {
    filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
    },
    manage_folds = false,
    max_width = 50,
    min_width = 30,
    close_on_select = false,
    show_guides = false,
}

require("aerial").setup(options)
require("telescope").load_extension("aerial")
