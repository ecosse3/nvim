local tokyonight_colors = require("tokyonight.colors").setup({})

-- Tokyonight config
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_colors = {
  border = '#1A1B26';
}

-- Nighyfly config
vim.g.nightflyCursorColor         = 1
vim.g.nightflyUnderlineMatchParen = 0
vim.g.nightflyNormalFloat         = 1

vim.cmd('colorscheme ' .. EcoVim.colorscheme)

-- Cursor line
vim.highlight.create('CursorLineNR', { guifg = "Yellow", ctermfg = "Yellow", guibg = "None", cterm = "bold" }, false);

if EcoVim.colorscheme == 'tokyonight' then
  vim.highlight.link('LineNr', 'Comment', true)
  vim.highlight.create('NormalFloat', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('FloatBorder', { guibg = "None" }, false);
  vim.highlight.create('WhichKeyFloat', { guibg = "None" }, false);
  vim.highlight.create('BufferTabpageFill', { guifg = "None" }, false);
  vim.highlight.create('VertSplit', { guibg = "#16161e", guifg = "#16161e" }, false);
  vim.highlight.create('TelescopeNormal', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('TelescopeBorder', { guibg = "None", guifg = "None" }, false);
  vim.highlight.link('TelescopeMatching', 'Constant', true);
  vim.highlight.link('GitSignsCurrentLineBlame', 'Comment', true);
  vim.highlight.create('StatusLine', { guibg = "None" }, false);
  vim.highlight.create('StatusLineNC', { guibg = "None" }, false);
  vim.highlight.create('rainbowcol1', { guifg = tokyonight_colors.blue, ctermfg = 9 }, false);
  vim.highlight.create('Boolean', { guifg = "#F7768E" }, false);
  vim.highlight.create('BufferOffset', { gui = 'bold', guifg = "None", guibg = "#16161e" }, false);

  -- Completion Menu Colors

  local highlights = {
    CmpItemAbbr            = { fg = tokyonight_colors.dark3, bg = "NONE" },
    CmpItemKindClass       = { fg = tokyonight_colors.orange             },
    CmpItemKindConstructor = { fg = tokyonight_colors.purple             },
    CmpItemKindFolder      = { fg = tokyonight_colors.blue2              },
    CmpItemKindFunction    = { fg = tokyonight_colors.blue               },
    CmpItemKindInterface   = { fg = tokyonight_colors.teal, bg = "NONE"  },
    CmpItemKindKeyword     = { fg = tokyonight_colors.magneta2           },
    CmpItemKindMethod      = { fg = tokyonight_colors.red                },
    CmpItemKindReference   = { fg = tokyonight_colors.red1               },
    CmpItemKindSnippet     = { fg = tokyonight_colors.dark3              },
    CmpItemKindVariable    = { fg = tokyonight_colors.cyan, bg = "NONE"  },
    CmpItemKindText        = { fg = "LightGrey"                          },
    CmpItemMenu            = { fg = "#C586C0", bg = "NONE"               },
    CmpItemAbbrMatch       = { fg = "#569CD6", bg = "NONE"               },
    CmpItemAbbrMatchFuzzy  = { fg = "#569CD6", bg = "NONE"               },
  }

  vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = tokyonight_colors.blue0 })

  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

if EcoVim.colorscheme == 'nightfly' then
  -- Errors
  vim.highlight.create('LspDiagnosticsVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);
  vim.highlight.create('DiagnosticVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);

  -- Warnings
  vim.highlight.create('LspDiagnosticsVirtualTextWarning', { guifg = "Yellow", ctermfg = "Yellow" }, false);
  vim.highlight.create('DiagnosticVirtualTextWarn', { guifg = "Yellow", ctermfg = "Yellow" }, false);

  -- Info & Hints
  vim.highlight.create('DiagnosticVirtualTextInfo', { guifg = "White", ctermfg = "White" }, false);
  vim.highlight.create('DiagnosticVirtualTextHint', { guifg = "White", ctermfg = "White" }, false);

  -- Comment in italics
  vim.highlight.create('Comment', { gui = "italic", cterm = "italic" }, false);

  -- Change color of floating popup border
  vim.highlight.link('FloatBorder', 'NightflyRed', true);
end
