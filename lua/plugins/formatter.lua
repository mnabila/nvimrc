local M = {}

function M.config()
    local tempdir = "/tmp"

    local remove_whitespace = {
        { cmd = { "sed -i 's/[ \t]*$//'" } },
    }

    local prettier = {
        {
            cmd = {
                function(file)
                    local config = vim.loop.os_homedir() .. "/.config/nvim/.prettierrc"
                    return string.format('prettier --config %s --tab-width %s -w "%s"', config, vim.bo.shiftwidth, file)
                end,
            },
            tempfile_dir = tempdir,
        },
    }

    local shfmt = {
        {
            cmd = {
                function(file)
                    return string.format("shfmt -i %s -w '%s'", vim.bo.shiftwidth, file)
                end,
            },
            tempfile_dir = tempdir,
        },
    }

    local stylua = {
        {
            cmd = {
                function(file)
                    local config = vim.loop.os_homedir() .. "/.config/nvim/.stylua.toml"
                    return string.format("stylua --config-path %s %s %s ", config, file, file)
                end,
            },
            tempfile_dir = tempdir,
        },
    }

    local markdownfmt = {
        { cmd = { "prettier -w" }, tempfile_dir = tempdir },
        {
            cmd = { "black" },
            start_pattern = "^```python$",
            end_pattern = "^```$",
            target = "current",
            tempfile_dir = tempdir,
        },
    }

    local black = { { cmd = { "black" }, tempfile_dir = tempdir } }

    vim.g.format_debug = true
    require("format").setup({
        ["*"] = remove_whitespace,
        javascript = prettier,
        typescript = prettier,
        html = prettier,
        css = prettier,
        sh = shfmt,
        lua = stylua,
        markdown = markdownfmt,
        json = prettier,
        python = black,
        scss = prettier,
        yaml = prettier,
    })
end

return M
