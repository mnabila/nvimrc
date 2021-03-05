local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
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
  if squeeze_width > 40 then
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
                return alias[vim.fn.mode()]
            end,
            separator = ' ',
            highlight = {colors.bwhite, colors.black, 'bold'},
        }
    },
    {
        GitIcon = {
            provider = function() return '' end,
            condition = condition.check_git_workspace,
            separator = ' ',
            highlight = {colors.yellow, colors.black}
        }
    },
    {
        GitBranch = {
            provider = 'GitBranch',
            condition = condition.check_git_workspace,
            highlight = {colors.bwhite, colors.black}
        }
    },
    {
        DiffAdd = {
            provider = 'DiffAdd',
            icon = '+',
            condition = condition.check_git_workspace,
            highlight = {colors.green, colors.black}
        }
    },
    {
        DiffModified = {
            provider = 'DiffModified',
            icon = '~',
            condition = condition.check_git_workspace,
            highlight = {colors.cyan, colors.black}
        }
    },
    {
        DiffRemove = {
            provider = 'DiffRemove',
            icon = '-',
            condition = condition.check_git_workspace,
            separator = ' ',
            highlight = {colors.red, colors.black}
        }
    },
    {
        FileIcon = {
            provider = 'FileIcon',
            condition = condition.buffer_not_empty,
            highlight = {
                require('galaxyline.provider_fileinfo').get_file_icon_color,
                colors.black
            },
        },
    },
    {
        FileName = {
            provider = 'FileName',
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
            provider = 'DiagnosticError',
            icon = '  ',
            condition = condition.check_active_lsp,
            highlight = {colors.red, colors.black}
        },
    },
    {
        DiagnosticWarn = {
            provider = 'DiagnosticWarn',
            icon = '  ',
            condition = condition.check_active_lsp,
            highlight = {colors.yellow, colors.black}
        },
    },
    {
        FileFormat = {
            provider = 'FileFormat',
            separator = ' ',
            highlight = {colors.bwhite, colors.black}
        }
    },
    {
        FileEncode = {
            provider = 'FileEncode',
            separator = ' ',
            highlight = {colors.bwhite, colors.black}
        }
    },
    {
        LineInfo = {
            provider = 'LineColumn',
            separator = ' ',
            highlight = {colors.bwhite, colors.black}
        }
    },
}

gl.short_line_list = {'NvimTree'}
gls.short_line_left = {
    {
        BufferIcon = {
            provider = 'BufferIcon',
            separator = ' ',
            highlight = {colors.bwhite, colors.black}
        }
    },
    {
        FileName = {
            provider = 'FileName',
            highlight = {colors.bwhite, colors.black, 'bold'}

        }
    }
}
