local M = {}
local tempdir = "/tmp"

local function remove_whitespace()
    return {
        { cmd = { "sed -i 's/[ \t]*$//'" } },
    }
end

local function prettier(params)
    return {
        {
            cmd = {
                function(file)
                    local config = vim.loop.os_homedir() .. "/.config/nvim/.prettierrc"
                    if params ~= nil then
                        return string.format(
                            'prettier --config %s --tab-width %s -w "%s" %s',
                            config,
                            vim.bo.shiftwidth,
                            file,
                            params
                        )
                    end
                    return string.format('prettier --config %s --tab-width %s -w "%s"', config, vim.bo.shiftwidth, file)
                end,
            },
            tempfile_dir = tempdir,
        },
    }
end

local function shfmt()
    return {
        {
            cmd = {
                function(file)
                    return string.format("shfmt -i %s -w '%s'", vim.bo.shiftwidth, file)
                end,
            },
            tempfile_dir = tempdir,
        },
    }
end

local function stylua()
    return {
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
end

local function markdownfmt()
    return {

        { cmd = { "prettier -w" }, tempfile_dir = tempdir },
        {
            cmd = { "black" },
            start_pattern = "^```python$",
            end_pattern = "^```$",
            target = "current",
            tempfile_dir = tempdir,
        },
    }
end

local function black()
    return { { cmd = { "black" }, tempfile_dir = tempdir } }
end

function M.config()
    vim.g.format_debug = true

    require("format").setup({
        ["*"] = remove_whitespace(),
        javascript = prettier(),
        typescript = prettier(),
        html = prettier("--print-width 1000"),
        css = prettier(),
        sh = shfmt(),
        lua = stylua(),
        markdown = markdownfmt(),
        json = prettier(),
        python = black(),
        scss = prettier(),
        yaml = prettier(),
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
