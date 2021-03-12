local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
local vcs = require('galaxyline.provider_vcs')
local buffer = require('galaxyline.provider_buffer')
local fileinfo = require('galaxyline.provider_fileinfo')
local diagnostic = require('galaxyline.provider_diagnostic')
local lspclient = require('galaxyline.provider_lsp')
local icons = require('galaxyline.provider_fileinfo').define_file_icon()

local colors = {
    black     = '#282828',
    bblack    = '#928374',
    red       = '#cc241d',
    bred      = '#fb4934',
    green     = '#98971a',
    bgreen    = '#b8bb26',
    yellow    = '#d79921',
    byellow   = '#fabd2f',
    blue      = '#458588',
    bblue     = '#83a598',
    mangenta  = '#b16286',
    bmangenta = '#d3869b',
    cyan      = '#689d6a',
    bcyan     = '#8ec07c',
    white     = '#a89984',
    bwhite    = '#ebdbb2',
}

icons['man'] = {colors.green, ''}

function condition.checkwidth()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 50 then
    return true
  end
    return false
end

gls.left = {
    {
        Mode = {
            provider = function()
                local alias = {n = 'NORMAL', i = 'INSERT', c = 'COMMAND', V= 'VISUAL', [''] = 'VISUAL'}
                if not condition.checkwidth() then
                    alias = {n = 'N', i = 'I', c = 'C', V= 'V', [''] = 'V'}
                end
                return string.format('   %s ', alias[vim.fn.mode()])
            end,
            highlight = {colors.black, colors.yellow, 'bold'},
        }
    },
    {
        GitIcon = {
            provider = function() return '   ' end,
            condition = function() return condition.check_git_workspace() and condition.checkwidth() end,
            highlight = {colors.black, colors.bblack}
        }
    },
    {
        GitBranch = {
            provider = function() return string.format('%s ', vcs.get_git_branch()) end,
            condition = function() return condition.check_git_workspace() and condition.checkwidth() end,
            highlight = {colors.black, colors.bblack}
        }
    },
    {
        DiffAdd = {
            provider = vcs.diff_add,
            icon = '+',
            condition = function() return condition.check_git_workspace() and condition.checkwidth() end,
            highlight = {colors.black, colors.bblack}
        }
    },
    {
        DiffModified = {
            provider = vcs.diff_modified,
            icon = '~',
            condition = function() return condition.check_git_workspace() and condition.checkwidth() end,
            highlight = {colors.black, colors.bblack}
        }
    },
    {
        DiffRemove = {
            provider = vcs.diff_remove,
            icon = '-',
            condition = function() return condition.check_git_workspace() and condition.checkwidth() end,
            highlight = {colors.black, colors.bblack}
        }
    },
    {
        BlankSpace = {
            provider = function() return ' ' end,
            highlight = {colors.black, colors.black}
        }
    },
    {
        FileIcon = {
            provider = fileinfo.get_file_icon,
            condition = condition.buffer_not_empty,
            highlight = {
                fileinfo.get_file_icon_color,
                colors.black
            },
        },
    },
    {
        FileName = {
            provider = function()
                return string.format('%s| %s ', fileinfo.get_file_size(), fileinfo.get_current_file_name())
            end,
            condition = condition.buffer_not_empty,
            highlight = {colors.bwhite, colors.black}
        }
    },
    {
        Blank = {
            provider = function() return '' end,
            highlight = {colors.black, colors.black}

        }
    }
}

gls.right = {
    {
        DiagnosticError = {
            provider = diagnostic.get_diagnostic_error,
            icon = '  ',
            condition = function() return condition.check_active_lsp() and condition.checkwidth() end,
            highlight = {colors.red, colors.black}
        },
    },
    {
        DiagnosticWarn = {
            provider = diagnostic.get_diagnostic_warn,
            icon = '  ',
            condition = function() return condition.check_active_lsp() and condition.checkwidth() end,
            highlight = {colors.yellow, colors.black}
        },
    },
    {
        DiagnosticHint = {
            provider = diagnostic.get_diagnostic_hint,
            icon = '  ',
            condition = function() return condition.check_active_lsp() and condition.checkwidth() end,
            highlight = {colors.cyan, colors.black}
        }
    },
    {
        DiagnosticInfo = {
            provider = diagnostic.get_diagnostic_info,
            icon = '  ',
            condition = function() return condition.check_active_lsp() and condition.checkwidth() end,
            highlight = {colors.cyan, colors.black}
        }
    },
    {
        LspStatus = {
            provider = function() return string.format(' %s ', lspclient.get_lsp_client()) end,
            icon = '   ',
            condition = function() return condition.check_active_lsp() and condition.checkwidth() end,
            highlight = {colors.white, colors.black}
        }
    },
    {
        FileType = {
            provider = function() return string.format(' %s ', buffer.get_buffer_filetype()) end,
            condition = function() return buffer.get_buffer_filetype() ~= '' end,
            highlight = {colors.white, colors.black}
        }
    },
    {
        FileFormat = {
            provider = function() return string.format('   %s ', fileinfo.get_file_format()) end,
            condition = condition.checkwidth,
            highlight = {colors.black, colors.white}
        }
    },
    {
        FileEncode = {
            provider = function() return string.format('   %s ', fileinfo.get_file_encode()) end,
            condition = condition.checkwidth,
            highlight = {colors.black, colors.bblack}
        }
    },
    {
        LineInfo = {
            provider = function() return string.format('   %s ', fileinfo.line_column()) end,
            highlight = {colors.black, colors.yellow}
        }
    },
}

gl.short_line_list = {'NvimTree'}
gls.short_line_left = {
    {
        BufferIcon = {
            provider = function()
                local icon = buffer.get_buffer_type_icon()
                if icon ~= nil then
                    return string.format(' %s ', icon)
                end
            end,
            highlight = {colors.white, colors.black}
        }
    },
    {
        BufferName = {
            provider = function()
                if vim.fn.index(gl.short_line_list, vim.bo.filetype) ~= -1 then
                    local filetype = vim.bo.filetype
                    if filetype == 'NvimTree' then
                        return ' Explorer '
                    end
                else
                    if fileinfo.get_current_file_name() ~= '' then
                        return string.format(' %s %s| %s ', fileinfo.get_file_icon(), fileinfo.get_file_size() , fileinfo.get_current_file_name())
                    end
                end
            end,
            separator = '',
            highlight = {colors.white, colors.black}
        }
    }
}
