local present, tk_colors = pcall(require, "tokyonight.colors")
if not present then
  return
end

local tokyonight_colors = tk_colors.setup({})

-- Tokyonight Colorscheme Config
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_colors = {
  border = '#1A1B26';
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup Colorscheme                                        │
-- ╰──────────────────────────────────────────────────────────╯
vim.cmd('colorscheme ' .. EcoVim.colorscheme)

-- Ecovim Colors
vim.highlight.create('EcovimPrimary', { guifg = "#488DFF" }, false);
vim.highlight.create('EcovimSecondary', { guifg = "#FFA630" }, false);

vim.highlight.create('EcovimPrimaryBold', { gui = "bold", guifg = "#488DFF" }, false);
vim.highlight.create('EcovimSecondaryBold', { gui = "bold", guifg = "#FFA630" }, false);

vim.highlight.create('EcovimHeader', { gui = "bold", guifg = "#488DFF" }, false);
vim.highlight.create('EcovimHeaderInfo', { gui = "bold", guifg = "#FFA630" }, false);
vim.highlight.create('EcovimFooter', { gui = "bold", guifg = "#FFA630" }, false);

-- Tokyonight Colorscheme Specific Config
if EcoVim.colorscheme == 'tokyonight' then
  -- Lines
  vim.highlight.link('CursorLineNR', 'EcovimSecondary', true)
  vim.highlight.link('LineNr', 'Comment', true)

  -- Floats/Windows
  vim.highlight.create('NormalFloat', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('FloatBorder', { guibg = "None" }, false);
  vim.highlight.create('WhichKeyFloat', { guibg = "None" }, false);
  vim.highlight.create('BufferTabpageFill', { guifg = "None" }, false);
  vim.highlight.create('VertSplit', { guibg = "#16161e", guifg = "#16161e" }, false);

  -- Telescope
  vim.highlight.link('TelescopeTitle', 'EcovimSecondary', true);
  vim.highlight.create('TelescopeNormal', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('TelescopeBorder', { guibg = "None" }, false);
  vim.highlight.link('TelescopeMatching', 'Constant', true);

  -- Diagnostics

  -- Misc
  vim.highlight.link('GitSignsCurrentLineBlame', 'Comment', true);
  vim.highlight.create('StatusLine', { guibg = "None" }, false);
  vim.highlight.create('StatusLineNC', { guibg = "None" }, false);
  vim.highlight.create('rainbowcol1', { guifg = tokyonight_colors.blue, ctermfg = 9 }, false);
  vim.highlight.create('Boolean', { guifg = "#F7768E" }, false);
  vim.highlight.link('BufferOffset', 'EcovimSecondary', true);

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
