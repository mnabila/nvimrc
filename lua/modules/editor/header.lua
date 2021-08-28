local M = {}

function M.config()
    vim.g.header_auto_add_header = 0
    vim.g.header_alignment = 1
    vim.g.header_max_size = 20
    vim.g.header_field_filename = 1
    vim.g.header_field_filename_path = 0
    vim.g.header_field_author = "M. Nabil Adani"
    vim.g.header_field_author_email = "nblid48[at]gmail[dot]com"
    vim.g.header_field_copyright = ""
    vim.g.header_field_timestamp = 1
    vim.g.header_field_modified_timestamp = 1
    vim.g.header_field_modified_by = 1
    vim.g.header_field_timestamp_format = "%A, %d/%m/%Y %H:%M %Z"
    vim.g.header_field_license_id = "MIT License"
    vim.g.header_cfg_comment_char = ";"
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
