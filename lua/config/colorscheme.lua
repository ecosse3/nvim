local present, tokyonight = pcall(require, "tokyonight")
if not present then
  return
end

local c = require("tokyonight.colors").setup()

-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup Colorscheme                                        │
-- ╰──────────────────────────────────────────────────────────╯
tokyonight.setup({
  style = "night",

  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value `:help attr-list`
    comments = "italic",
    keywords = "italic",
    functions = "NONE",
    variables = "NONE",
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  on_colors = function(colors)
    colors.border = "#1A1B26"
  end,

  --- You can override specific highlights to use other groups or a hex color
  --- fucntion will be called with a Highlights and ColorScheme table
  -- on_highlights = function(highlights, colors) end,
  on_highlights = function(hl, c)
    local prompt = "#FFA630"
    local text = "#488dff"
    local none = "NONE"

    hl.TelescopeTitle = {
      fg = prompt,
    }
    hl.TelescopeNormal = {
      bg = none,
      fg = none,
    }
    hl.TelescopeBorder = {
      bg = none,
      fg = text
    }
    hl.TelescopeMatching = {
      fg = prompt
    }
    hl.MsgArea = {
      fg = c.fg_dark
    }
  end,
})

-- Set Colorscheme
vim.cmd('colorscheme ' .. EcoVim.colorscheme)

-- IF NIGHTLY
if vim.fn.has("nvim-0.8") then
  -- Ecovim Colors
  vim.api.nvim_set_hl(0, 'EcovimPrimary', { fg = "#488dff" });
  vim.api.nvim_set_hl(0, 'EcovimSecondary', { fg = "#FFA630" });

  vim.api.nvim_set_hl(0, 'EcovimPrimaryBold', { bold = true, fg = "#488DFF" });
  vim.api.nvim_set_hl(0, 'EcovimSecondaryBold', { bold = true, fg = "#FFA630" });

  vim.api.nvim_set_hl(0, 'EcovimHeader', { bold = true, fg = "#488DFF" });
  vim.api.nvim_set_hl(0, 'EcovimHeaderInfo', { bold = true, fg = "#FFA630" });
  vim.api.nvim_set_hl(0, 'EcovimFooter', { bold = true, fg = "#FFA630" });

  -- Tokyonight Colorscheme Specific Config
  if EcoVim.colorscheme == 'tokyonight' then
    -- Lines
    vim.api.nvim_set_hl(0, 'CursorLineNR', { link = 'EcovimSecondary' })
    vim.api.nvim_set_hl(0, 'LineNr', { link = 'Comment' })

    -- Floats/Windows
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "None", fg = "None" });
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "None", fg = "#488DFF" });
    vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = "None", fg = "#488DFF" });
    vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = "None" });
    vim.api.nvim_set_hl(0, 'VertSplit', { bg = "#16161e", fg = "#16161e" });
    vim.api.nvim_set_hl(0, 'BqfPreviewBorder', { link = 'FloatBorder' })

    -- Telescope
    -- vim.api.nvim_set_hl(0, 'TelescopeTitle', { link = 'EcovimSecondary' });
    -- vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = "None", fg = "None" });
    -- vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = "None", fg = "#488DFF" });
    -- vim.api.nvim_set_hl(0, 'TelescopeMatching', { link = 'EcovimSecondary' });

    -- Tree
    vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { bg = "None", fg = "None" });

    -- Diagnostics

    -- Misc
    vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { link = 'Comment' });
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = "None" });
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = "None" });
    vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = c.blue, ctermfg = 9 });
    vim.api.nvim_set_hl(0, 'Boolean', { fg = "#F7768E" });
    vim.api.nvim_set_hl(0, 'BufferOffset', { link = 'EcovimSecondary' });

    -- Completion Menu Colors
    local highlights = {
      CmpItemAbbr            = { fg = c.dark3, bg = "NONE" },
      CmpItemKindClass       = { fg = c.orange },
      CmpItemKindConstructor = { fg = c.purple },
      CmpItemKindFolder      = { fg = c.blue2 },
      CmpItemKindFunction    = { fg = c.blue },
      CmpItemKindInterface   = { fg = c.teal, bg = "NONE" },
      CmpItemKindKeyword     = { fg = c.magneta2 },
      CmpItemKindMethod      = { fg = c.red },
      CmpItemKindReference   = { fg = c.red1 },
      CmpItemKindSnippet     = { fg = c.dark3 },
      CmpItemKindVariable    = { fg = c.cyan, bg = "NONE" },
      CmpItemKindText        = { fg = "LightGrey" },
      CmpItemMenu            = { fg = "#C586C0", bg = "NONE" },
      CmpItemAbbrMatch       = { fg = "#569CD6", bg = "NONE" },
      CmpItemAbbrMatchFuzzy  = { fg = "#569CD6", bg = "NONE" },
    }

    vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = c.blue0 })

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end

  -- ELSE
else
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
    vim.highlight.link('BqfPreviewBorder', 'FloatBorder', true)

    -- Telescope
    vim.highlight.link('TelescopeTitle', 'EcovimSecondary', true);
    vim.highlight.create('TelescopeNormal', { guibg = "None", guifg = "None" }, false);
    vim.highlight.create('TelescopeBorder', { guibg = "None" }, false);
    vim.highlight.link('TelescopeMatching', 'EcovimSecondary', true);

    -- Diagnostics

    -- Misc
    vim.highlight.link('GitSignsCurrentLineBlame', 'Comment', true);
    vim.highlight.create('StatusLine', { guibg = "None" }, false);
    vim.highlight.create('StatusLineNC', { guibg = "None" }, false);
    vim.highlight.create('rainbowcol1', { guifg = c.blue, ctermfg = 9 }, false);
    vim.highlight.create('Boolean', { guifg = "#F7768E" }, false);
    vim.highlight.link('BufferOffset', 'EcovimSecondary', true);

    -- Completion Menu Colors
    local highlights = {
      CmpItemAbbr            = { fg = c.dark3, bg = "NONE" },
      CmpItemKindClass       = { fg = c.orange },
      CmpItemKindConstructor = { fg = c.purple },
      CmpItemKindFolder      = { fg = c.blue2 },
      CmpItemKindFunction    = { fg = c.blue },
      CmpItemKindInterface   = { fg = c.teal, bg = "NONE" },
      CmpItemKindKeyword     = { fg = c.magneta2 },
      CmpItemKindMethod      = { fg = c.red },
      CmpItemKindReference   = { fg = c.red1 },
      CmpItemKindSnippet     = { fg = c.dark3 },
      CmpItemKindVariable    = { fg = c.cyan, bg = "NONE" },
      CmpItemKindText        = { fg = "LightGrey" },
      CmpItemMenu            = { fg = "#C586C0", bg = "NONE" },
      CmpItemAbbrMatch       = { fg = "#569CD6", bg = "NONE" },
      CmpItemAbbrMatchFuzzy  = { fg = "#569CD6", bg = "NONE" },
    }

    vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = c.blue0 })

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end
end
-- END
