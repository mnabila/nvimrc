local M = {}

function M.config()
    local gl = require("galaxyline")
    local gls = gl.section
    local condition = require("galaxyline.condition")
    local vcs = require("galaxyline.provider_vcs")
    local buffer = require("galaxyline.provider_buffer")
    local fileinfo = require("galaxyline.provider_fileinfo")
    local diagnostic = require("galaxyline.provider_diagnostic")
    local lspclient = require("galaxyline.provider_lsp")
    local icons = require("galaxyline.provider_fileinfo").define_file_icon()
    local colors = require("gruvboy.colors")

    icons["man"] = { colors.green, "" }

    gls.left = {
        {
            Mode = {
                provider = function()
                    local alias = { n = "NORMAL", i = "INSERT", c = "COMMAND", V = "VISUAL", [""] = "VISUAL" }
                    if not condition.hide_in_width() then
                        alias = { n = "N", i = "I", c = "C", V = "V", [""] = "V" }
                    end
                    return string.format("   %s ", alias[vim.fn.mode()])
                end,
                highlight = { colors.bg0, colors.yellow, "bold" },
                separator = " ",
                separator_highlight = { colors.none, colors.none },
            },
        },
        {
            GitBranch = {
                provider = {
                    function()
                        return "  "
                    end,
                    function()
                        return string.format("%s ", vcs.get_git_branch())
                    end,
                },
                condition = function()
                    local function is_empty()
                        return vcs.get_git_branch() ~= nil
                    end
                    return condition.check_git_workspace() and condition.hide_in_width() and is_empty()
                end,
                highlight = { colors.bg0, colors.gray },
            },
        },
        {
            DiffAdd = {
                provider = vcs.diff_add,
                icon = "+",
                condition = function()
                    return condition.check_git_workspace() and condition.hide_in_width()
                end,
                highlight = { colors.bg0, colors.gray },
            },
        },
        {
            DiffModified = {
                provider = vcs.diff_modified,
                icon = "~",
                condition = function()
                    return condition.check_git_workspace() and condition.hide_in_width()
                end,
                highlight = { colors.bg0, colors.gray },
            },
        },
        {
            DiffRemove = {
                provider = vcs.diff_remove,
                icon = "-",
                condition = function()
                    return condition.check_git_workspace() and condition.hide_in_width()
                end,
                highlight = { colors.bg0, colors.gray },
            },
        },
        {
            BlankSpace = {
                provider = function()
                    return " "
                end,
                highlight = { colors.bg0, colors.bg0 },
            },
        },
        {
            Blank = {
                provider = function()
                    return ""
                end,
                highlight = { colors.bg0, colors.bg0 },
            },
        },
    }

    gls.mid = {
        {
            FileIcon = {
                provider = fileinfo.get_file_icon,
                condition = condition.buffer_not_empty,
                highlight = {
                    fileinfo.get_file_icon_color,
                    colors.bg0,
                },
            },
        },
        {
            FileName = {
                provider = function()
                    return string.format("%s| %s ", fileinfo.get_file_size(), fileinfo.get_current_file_name())
                end,
                condition = condition.buffer_not_empty,
                highlight = { colors.fg1, colors.bg0 },
            },
        },
    }
    gls.right = {
        {
            DiagnosticError = {
                provider = diagnostic.get_diagnostic_error,
                icon = "  ",
                condition = function()
                    return condition.check_active_lsp() and condition.hide_in_width()
                end,
                highlight = { colors.red, colors.bg0 },
            },
        },
        {
            DiagnosticWarn = {
                provider = diagnostic.get_diagnostic_warn,
                icon = "  ",
                condition = function()
                    return condition.check_active_lsp() and condition.hide_in_width()
                end,
                highlight = { colors.yellow, colors.bg0 },
            },
        },
        {
            DiagnosticHint = {
                provider = diagnostic.get_diagnostic_hint,
                icon = "  ",
                condition = function()
                    return condition.check_active_lsp() and condition.hide_in_width()
                end,
                highlight = { colors.aqua, colors.bg0 },
            },
        },
        {
            DiagnosticInfo = {
                provider = diagnostic.get_diagnostic_info,
                icon = "  ",
                condition = function()
                    return condition.check_active_lsp() and condition.hide_in_width()
                end,
                highlight = { colors.aqua, colors.bg0 },
            },
        },
        {
            LspStatus = {
                provider = function()
                    return string.format(" %s ", lspclient.get_lsp_client())
                end,
                icon = "   ",
                condition = function()
                    return condition.check_active_lsp() and condition.hide_in_width()
                end,
                highlight = { colors.fg4, colors.bg0 },
            },
        },
        {
            FileType = {
                provider = function()
                    return string.format(" %s ", buffer.get_buffer_filetype())
                end,
                condition = function()
                    return buffer.get_buffer_filetype() ~= ""
                end,
                highlight = { colors.fg4, colors.bg0 },
            },
        },
        {
            FileFormat = {
                provider = function()
                    return string.format("   %s ", fileinfo.get_file_format())
                end,
                condition = condition.hide_in_width,
                highlight = { colors.bg0, colors.fg4 },
            },
        },
        {
            FileEncode = {
                provider = function()
                    return string.format("   %s ", fileinfo.get_file_encode())
                end,
                condition = condition.hide_in_width,
                highlight = { colors.bg0, colors.gray },
            },
        },
        {
            LineInfo = {
                icon = "  ",
                provider = function()
                    return fileinfo.line_column()
                end,
                highlight = { colors.bg0, colors.yellow },
                separator = " ",
                separator_highlight = { colors.none, colors.none },
            },
        },
    }

    gl.short_line_list = { "NvimTree" }
    gls.short_line_left = {
        {
            BufferIcon = {
                provider = function()
                    local icon = buffer.get_buffer_type_icon()
                    if icon ~= nil then
                        return string.format(" %s ", icon)
                    end
                end,
                highlight = { colors.fg4, colors.bg0 },
            },
        },
        {
            BufferName = {
                provider = function()
                    if vim.fn.index(gl.short_line_list, vim.bo.filetype) ~= -1 then
                        local filetype = vim.bo.filetype
                        if filetype == "NvimTree" then
                            return " Explorer "
                        end
                    else
                        if fileinfo.get_current_file_name() ~= "" then
                            return string.format(
                                " %s %s| %s ",
                                fileinfo.get_file_icon(),
                                fileinfo.get_file_size(),
                                fileinfo.get_current_file_name()
                            )
                        end
                    end
                end,
                separator = "",
                highlight = { colors.fg4, colors.bg0 },
            },
        },
    }
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
