local tempdir = "/tmp"

local remove_whitespace = {
    {cmd = {"sed -i 's/[ \t]*$//'"}}
}

local prettier = {
    {
        cmd = {
            function(file)
                local config = os.getenv("HOME") .. "/.config/nvim/.prettierrc"
                return string.format('prettier --config %s --tab-width %s -w "%s"', config, vim.bo.shiftwidth, file)
            end
        },
        tempfile_dir = tempdir
    }
}

local shfmt = {
    {
        cmd = {function(file) return string.format("shfmt -i %s -w '%s'", vim.bo.shiftwidth, file) end},
        tempfile_dir = tempdir
    }
}

local luafmt = {
    {
        cmd = {
            function(file)
                local config = os.getenv("HOME") .. "/.config/nvim/luaformatter.yaml"
                return string.format('lua-format -c %s -i', config, file)
            end
        },
        tempfile_dir = tempdir
    }
}

local markdownfmt = {
    {cmd = {"prettier -w"}, tempfile_dir = tempdir},
    {cmd = {"black"}, start_pattern = "^```python$", end_pattern = "^```$", target = "current", tempfile_dir = tempdir}
}

local black = {{cmd = {"black"}, tempfile_dir = tempdir}}

vim.g.format_debug = true
require('format').setup {
    ['*'] = remove_whitespace,
    javascript = prettier,
    typescript = prettier,
    html = prettier,
    css = prettier,
    sh = shfmt,
    lua = luafmt,
    markdown = markdownfmt,
    json = prettier,
    python = black
}
