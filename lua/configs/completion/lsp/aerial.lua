local options = {
    backends = { "lsp", "markdown" },
    filter_kind = {
        "Array",
        "Class",
        "Constructor",
        "Enum",
        "Field",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Object",
        "Struct",
        "TypeParameter",
    },
    highlight_mode = "full_width",
    highlight_closest = true,
    highlight_on_hover = true,
    link_folds_to_tree = true,
    link_tree_to_folds = true,
    manage_folds = false,
    max_width = 0.4,
    min_width = 0.2,
    placement_editor_edge = true,
    show_guides = false,
    float = {
        border = "single",
        relative = "editor",
        max_height = 0.5,
        height = nil,
        min_height = { 8, 0.1 },
    },
}

require("aerial").setup(options)
require("telescope").load_extension("aerial")
