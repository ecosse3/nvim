--   ____       _                  _     _
--  / ___| __ _| | __ ___  ___   _| |   (_)_ __   ___
-- | |  _ / _` | |/ _` \ \/ | | | | |   | | '_ \ / _ \
-- | |_| | (_| | | (_| |>  <| |_| | |___| | | | |  __/
--  \____|\__,_|_|\__,_/_/\_\\__, |_____|_|_| |_|\___|
--                           |___/
-- See: https://github.com/glepnir/galaxyline.nvim

-- Configuration {{{1

-- Imports {{{2
local gl = require('galaxyline')
local condition = require('galaxyline.condition')
-- }}}2

-- Functions {{{2
local function u(code)
    if type(code) == 'string' then
        code = tonumber('0x' .. code)
    end
    local c = string.char
    if code <= 0x7f then
        return c(code)
    end
    local t = {}

    if code <= 0x07ff then
        t[1] = c(bit.bor(0xc0, bit.rshift(code, 6)))
        t[2] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    elseif code <= 0xffff then
        t[1] = c(bit.bor(0xe0, bit.rshift(code, 12)))
        t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
        t[3] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    else
        t[1] = c(bit.bor(0xf0, bit.rshift(code, 18)))
        t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 12), 0x3f)))
        t[3] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
        t[4] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    end

    return table.concat(t)
end

local function highlight(group, fg, bg, gui)
    local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)

    if gui ~= nil then
        cmd = cmd .. ' gui=' .. gui
    end

    vim.cmd(cmd)
end

-- }}}2

-- Settings {{{2
local lineLengthWarning = 80
local lineLengthError = 120
local leftbracket = "" -- Curve.
local rightbracket = "" -- Curve.
-- local leftbracket = u 'e0b2' -- Angle filled.
-- local rightbracket = u 'e0b0' -- Angle filled.
-- local leftbracket = u 'e0b3' -- Angle.
-- local rightbracket = u 'e0b1' -- Angle.
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer', 'tagbar'}
local gls = gl.section
-- }}}2

-- Colours, maps and icons {{{2
local colors = {
    bg              = '#011627',
    modetext        = '#000000',

    giticon         = '#FF8800',
    gitbg           = '#5C2C2E',
    gittext         = '#C5C5C5',

    diagerror       = '#F44747',
    diagwarn        = '#FF8800',
    diaghint        = '#4FC1FF',
    diaginfo        = '#FFCC66',

    lspicon         = '#68AF00',
    lspbg           = '#304B2E',
    lsptext         = '#C5C5C5',

    typeicon        = '#FF8800',
    typebg          = '#5C2C2E',
    typetext        = '#C5C5C5',

    statsicon       = '#9CDCFE',
    statsbg         = '#5080A0',
    statstext       = '#000000',

    lineokfg        = '#000000',
    lineokbg        = '#5080A0',
    linelongerrorfg = '#FF0000',
    linelongwarnfg  = '#FFFF00',
    linelongbg      = '#5080A0',

    shortbg         = '#DCDCAA',
    shorttext       = '#000000',

    shortrightbg    = '#3F3F3F',
    shortrighttext  = '#7C4C4E',

    red             = '#D16969',
    yellow          = '#DCDCAA',
    magenta         = '#D16D9E',
    green           = '#608B4E',
    orange          = '#FF8800',
    purple          = '#C586C0',
    blue            = '#569CD6',
    cyan            = '#4EC9B0'
    -- bg = '#2E2E2E',
    -- bg = '#292D38',
    -- yellow = '#DCDCAA',
    -- dark_yellow = '#D7BA7D',
    -- cyan = '#4EC9B0',
    -- green = '#608B4E',
    -- light_green = '#B5CEA8',
    -- string_orange = '#CE9178',
    -- orange = '#FF8800',
    -- purple = '#C586C0',
    -- magenta = '#D16D9E',
    -- grey = '#858585',
    -- blue = '#569CD6',
    -- vivid_blue = '#4FC1FF',
    -- light_blue = '#9CDCFE',
    -- red = '#D16969',
    -- error_red = '#F44747',
    -- info_yellow = '#FFCC66'
}

local mode_map = {
    ['n']        = {'#569CD6', 'NORMAL'},
    ['i']        = {'#D16969', 'INSERT'},
    ['R']        = {'#D16969', 'REPLACE'},
    ['c']        = {'#608B4E', 'COMMAND'},
    ['v']        = {'#C586C0', 'VISUAL'},
    ['V']        = {'#C586C0', 'VIS-LN'},
    ['']       = {'#C586C0', 'VIS-BLK'},
    ['s']        = {'#FF8800', 'SELECT'},
    ['S']        = {'#FF8800', 'SEL-LN'},
    ['']       = {'#DCDCAA', 'SEL-BLK'},
    ['t']        = {'#569CD6', 'TERMINAL'},
    ['Rv']       = {'#D16D69', 'VIR-REP'},
    ['rm']       = {'#FF0000', '- More -'},
    ['r']        = {'#FF0000', "- Hit-Enter -"},
    ['r?']       = {'#FF0000', "- Confirm -"},
    ['cv']       = {'#569CD6', "Vim Ex Mode"},
    ['ce']       = {'#569CD6', "Normal Ex Mode"},
    ['!']        = {'#569CD6', "Shell Running"},
    ['ic']       = {'#DCDCAA', 'Insert mode completion |compl-generic|'},
    ['no']       = {'#DCDCAA', 'Operator-pending'},
    ['nov']      = {'#DCDCAA', 'Operator-pending (forced charwise |o_v|)'},
    ['noV']      = {'#DCDCAA', 'Operator-pending (forced linewise |o_V|)'},
    ['noCTRL-V'] = {'#DCDCAA', 'Operator-pending (forced blockwise |o_CTRL-V|) CTRL-V is one character'},
    ['niI']      = {'#DCDCAA', 'Normal using |i_CTRL-O| in |Insert-mode|'},
    ['niR']      = {'#DCDCAA', 'Normal using |i_CTRL-O| in |Replace-mode|'},
    ['niV']      = {'#DCDCAA', 'Normal using |i_CTRL-O| in |Virtual-Replace-mode|'},
    ['ix']       = {'#DCDCAA', 'Insert mode |i_CTRL-X| completion'},
    ['Rc']       = {'#DCDCAA', 'Replace mode completion |compl-generic|'},
    ['Rx']       = {'#DCDCAA', 'Replace mode |i_CTRL-X| completion'},
}

-- See: https://www.nerdfonts.com/cheat-sheet
local icons = {
    vim  = u 'e62b',
    dos  = u 'e70f',
    unix = u 'f303',
    mac  = u 'f179',
}
-- }}}2

-- Rag status function {{{2
local function setLineWidthColours()
    local colbg = colors.statsbg
    local linebg = colors.statsbg

    if (vim.fn.col('.') > lineLengthError)
    then
        colbg = colors.linelongerrorfg
    elseif (vim.fn.col('.') > lineLengthWarning)
    then
        colbg = colors.linelongwarnfg
    end

    if (vim.fn.strwidth(vim.fn.getline('.')) > lineLengthError)
    then
        linebg = colors.linelongerrorfg
    elseif (vim.fn.strwidth(vim.fn.getline('.')) > lineLengthWarning)
    then
        linebg = colors.linelongwarnfg
    end

    highlight('LinePosHighlightStart', colbg, colors.statsbg)
    highlight('LinePosHighlightColNum', colors.statstext, colbg)
    highlight('LinePosHighlightMid', linebg, colbg)
    highlight('LineLenHighlightLenNum', colors.statstext, linebg)
    highlight('LinePosHighlightEnd', linebg, colors.statsbg)
end
-- }}}2

-- }}}1

-- Left {{{1
gls.left =
    {

        -- Edit mode {{{2
        {
            ViModeSpaceOnFarLeft = {
                provider = function() return " " end,
                highlight = {colors.giticon, colors.bg}
            }
        }, {
            ViModeLeft = {
                provider = function()
                    highlight('ViModeHighlight', mode_map[vim.fn.mode()][1], colors.bg)
                    return leftbracket
                end,
                highlight = 'ViModeHighlight'
            }
        }, {
            ViModeIconAndText = {
                provider = function()
                    highlight('GalaxyViMode', colors.modetext, mode_map[vim.fn.mode()][1])
                    return icons['vim'] .. " " .. mode_map[vim.fn.mode()][2]
                end,
                highlight = 'GalaxyViMode'
            }
        }, {
            ViModeRight = {
                provider = function()
                    return rightbracket
                end,
                separator = ' ',
                separator_highlight = 'ViModeHighlight',
                highlight = 'ViModeHighlight'
            }
        },
        -- }}}2

        -- Git info {{{2

        -- Git Branch Name {{{3
        {
            GitStart = {
                provider  = function() return leftbracket end,
                condition = condition.check_git_workspace,
                highlight = {colors.giticon, colors.bg}
            }
        }, {
            GitIcon = {
                provider = function()
                    return ' '
                end,
                condition           = condition.check_git_workspace,
                separator           = '',
                separator_highlight = {'NONE', colors.giticon},
                highlight           = {colors.gitbg, colors.giticon}
            }
        }, {
            GitMid = {
                provider  = function() return rightbracket .. ' ' end,
                condition = condition.check_git_workspace,
                highlight = {colors.giticon, colors.gitbg}
            }
        }, {
            GitBranch = {
                provider            = 'GitBranch',
                condition           = condition.check_git_workspace,
                separator           = ' ',
                separator_highlight = {'NONE', colors.gitbg},
                highlight           = {colors.gittext, colors.gitbg}
            }
        },
        -- }}}3

        -- Git Changes {{{3
        {
            DiffAdd = {
                provider  = 'DiffAdd',
                condition = condition.check_git_workspace,
                -- icon   = '  ',
                icon      = '  ',
                highlight = {colors.green, colors.gitbg}
            }
        }, {
            DiffModified = {
                provider  = 'DiffModified',
                condition = condition.check_git_workspace,
                -- icon   = '  ',
                icon      = ' 柳',
                highlight = {colors.blue, colors.gitbg}
            }
        }, {
            DiffRemove = {
                provider  = 'DiffRemove',
                condition = condition.check_git_workspace,
                -- icon   = '  ',
                icon      = '  ',
                highlight = {colors.red, colors.gitbg}
            }
        }, {
            EndGit = {
                provider            = function() return rightbracket end,
                condition           = condition.check_git_workspace,
                separator           = " ",
                separator_highlight = {colors.gitbg, colors.bg},
                highlight           = {colors.gitbg, colors.bg}
            }
        },
        -- }}}3

        -- }}}2

        -- Lsp Section {{{2

        -- Lsp Client {{{3
        {
            LspStart = {
                provider  = function() return leftbracket end,
                highlight = {colors.lspicon, colors.bg}
            }
        }, {
            LspIcon = {
                provider = function()
                    local name = ""

                    if gl.lspclient ~= nil then
                        name = gl.lspclient()
                    end

                    return '' .. name
                end,
                highlight = {colors.lspbg, colors.lspicon}
            }
        }, {
            LspMid = {
                provider  = function() return rightbracket .. ' ' end,
                highlight = {colors.lspicon, colors.lspbg}
            }
        }, {
            ShowLspClient = {
                provider  = 'GetLspClient',
                highlight = {colors.textbg, colors.lspbg}
            }
        }, {
            LspSpace = {
                provider  = function() return ' ' end,
                highlight = {colors.lspicon, colors.lspbg}
            }
        },
        -- }}}

        -- Diagnostics {{{3
        {
            DiagnosticError = {
                provider            = 'DiagnosticError',
                icon                = '  ',
                separator_highlight = {colors.gitbg, colors.bg},
                highlight           = {colors.diagerror, colors.lspbg}
            }
        }, {
            DiagnosticWarn = {
                provider   = 'DiagnosticWarn',
                icon       = '  ',
                highlight  = {colors.diagwarn, colors.lspbg}
            }
        }, {
            DiagnosticHint = {
                provider   = 'DiagnosticHint',
                icon       = '  ',
                highlight  = {colors.diaghint, colors.lspbg}
            }
        }, {
            DiagnosticInfo = {
                provider   = 'DiagnosticInfo',
                icon       = '  ',
                highlight  = {colors.diaginfo, colors.lspbg}
            }
        }, {
            LspSectionEnd  = {
                provider   = function() return rightbracket .. " " end,
                highlight  = {colors.lspbg, colors.bg}
            }
        }

        -- }}}3

        -- }}}2

-- local condition = require('galaxyline.condition')
-- local gls = gl.section
-- gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

    }
-- }}}1

-- Right {{{1
gls.right  =
    {
        -- Type {{{2
        {
            TypeStart = {
                provider  = function() return leftbracket end,
                highlight = {colors.typeicon, colors.bg}
            }
        }, {
            TypeFileFormatIcon = {
                provider = function()
                    local icon = icons[vim.bo.fileformat] or ''
                    return string.format(' %s', icon)
                end,
                highlight = {colors.typebg, colors.typeicon}
            }
        }, {
            TypeMid = {
                provider  = function() return rightbracket .. ' ' end,
                highlight = {colors.typeicon, colors.typebg}
            }
        } ,{
            FileName = {
                provider = function()
                  if #vim.fn.expand '%:p' == 0 then
                    return ''
                  end
                  if vim.fn.winwidth(0) > 150 then
                    return vim.fn.expand '%:~' .. ' '
                  else
                    return vim.fn.expand '%:t' .. ' '
                  end
                end,
                separator_highlight = {'NONE', colors.typebg},
                highlight = {colors.typetext, colors.typebg}
            }
        },{
            FileIcon = {
                provider  = 'FileIcon',
                highlight = {colors.typeicon, colors.typebg}
            }
        }, {
            BufferType = {
                provider  = 'FileTypeName',
                highlight = {colors.typetext, colors.typebg}
            }
        }, {
            FileSize = {
                provider            = 'FileSize',
                separator           = '  ',
                separator_highlight = {colors.typeicon, colors.typebg},
                highlight           = {colors.typetext, colors.typebg}
            }
        }, {
            FileEncode = {
                provider            = 'FileEncode',
                separator           = '',
                separator_highlight = {colors.typeicon, colors.typebg},
                highlight           = {colors.typetext, colors.typebg}
            }
        }, {
            TypeSectionEnd = {
                provider  = function() return rightbracket end,
                highlight = {colors.typebg, colors.bg}
            }
        }, {
            Space = {
                provider  = function() return ' ' end,
                highlight = {colors.typebg, colors.bg}
            }
        },
        -- }}}2

        -- Cursor Position Section {{{2
        {
            StatsSectionStart = {
                provider  = function() return leftbracket end,
                highlight = {colors.statsicon, colors.bg}
            }
        }, {
            StatsIcon = {
                provider = function()
                    return '⅑'
                end,
                highlight = {colors.statsbg, colors.statsicon}
            }
        }, {
            StatsMid = {
                provider  = function() return rightbracket .. ' ' end,
                highlight = {colors.statsicon, colors.statsbg}
            }
        }, {
            PerCent = {
                provider  = 'LinePercent',
                highlight = {colors.statstext, colors.statsbg}
            }
        }, {
            VerticalPosAndSize = {
                provider = function()
                    return string.format("%4i/%4i ", vim.fn.line('.'), vim.fn.line('$'))
                end,
                separator = '⇕ ',
                separator_highlight = {colors.statsicon, colors.statsbg},
                highlight = {colors.statstext, colors.statsbg}
            }
        }, {
            CursorColumnStart = {
                provider = function()
                    return leftbracket
                end,
                separator = '⇔ ',
                separator_highlight = {colors.statsicon, colors.statsbg},
                highlight = 'LinePosHighlightStart'
            }
        }, {
            CursorColumn = {
                provider = function()
                    setLineWidthColours()
                    return " " .. string.format("%3i", vim.fn.col('.')) .. "/"
                end,
                highlight = 'LinePosHighlightColNum'
            }
        }, {
            LineLengthStart = {
                provider = function()
                    return " " .. leftbracket
                end,
                highlight = 'LinePosHighlightMid'
            }
        }, {

            LineLength = {
                provider = function()
                    return ' ' .. string.format("%3i", string.len(vim.fn.getline('.')))
                end,
                highlight = 'LineLenHighlightLenNum'
            }
        }, {
            LineLengthEnd = {
                provider = function()
                    return " " .. rightbracket
                end,
                highlight = 'LinePosHighlightEnd'
            }
        }, {
            TabOrSpace = {
                provider = function()
                    if vim.bo.expandtab
                    then
                        return '⯀'
                    else
                        return '⯈'
                    end
                end,
                condition = condition.hide_in_width,
                highlight = {colors.statsicon, colors.statsbg}
            }
        }, {
            Tabstop = {
                provider = function()
                    if vim.bo.expandtab
                    then
                        return vim.bo.shiftwidth
                    else
                        return vim.bo.shiftwidth
                    end
                end,
                condition = condition.hide_in_width,
                highlight = {colors.statstext, colors.statsbg}
            }
        }, {
            StatsSpcSectionEnd = {
                provider  = function() return rightbracket .. " " end,
                highlight = {colors.statsbg, colors.bg}
            }
        }
        -- }}}2
}
-- }}}1

-- Left Short {{{1
gls.short_line_left =
    {
        {
            ShortSectionStart = {
                provider  = function() return leftbracket  end,
                highlight = {colors.shortbg, colors.bg}
            }
        },
        {
            ShortSectionSpace = {
                provider = function() return " "  end, highlight = {colors.shorttext, colors.shortbg}
            }
        },
        {
            LeftShortName = {
                provider  = 'FileTypeName',
                highlight = {colors.shorttext, colors.shortbg},
            }
        },
        {
            ShortSectionMid = {
                provider  = function() return " " end,
                highlight = {colors.shortbg, colors.shortbg}
            }
        },
        {
            LeftShortFileName = {
                provider            = 'SFileName',
                condition           = condition.buffer_not_empty,
                separator_highlight = {colors.shorttext, colors.shortbg},
                highlight           = {colors.shorttext, colors.shortbg},
            }
        },
        {
            ShortSectionEnd = {
                provider  = function() return rightbracket end,
                highlight = {colors.shortbg, colors.bg}
            }
        }
    }
-- }}}1

-- Right Short {{{1
gls.short_line_right = {
    BufferIcon = {
        provider            = 'BufferIcon',
        separator_highlight = {colors.shorttext, colors.bg},
        highlight           = {colors.shortrighttext, colors.bg}
    }
}
-- }}}1
