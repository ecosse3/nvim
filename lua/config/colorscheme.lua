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
  transparent = vim.g.neovide and true or false, -- Enable this to disable setting the background color
  terminal_colors = true,                        -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value `:help attr-list`
    comments = "NONE",
    keywords = "italic",
    functions = "NONE",
    variables = "NONE",
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = vim.g.neovide and "dark" or "dark",                 -- style for sidebars, see below
    floats = vim.g.neovide and "dark" or "dark",                   -- style for floating windows
  },
  sidebars = { "qf", "help", "snacks_layout_box", "snacks_picker_list" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3,                                                   -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false,                                       -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false,                                                   -- dims inactive windows
  lualine_bold = false,                                                   -- When `true`, section headers in the lualine theme will be bold

  cache = true,                                                           -- When set to true, the theme will be cached for better performance
  ---@type table<string, boolean|{enabled:boolean}>
  plugins = {
    -- enable all plugins when not using lazy.nvim
    -- set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    -- uses your plugin manager to automatically enable needed plugins
    -- currently only lazy.nvim is supported
    auto = true,
    -- add any plugins here that you want to enable
    -- for all possible plugins, see:
    --   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
    -- telescope = true,
  },
  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  on_colors = function(colors)
    colors.border = "#1A1B26"
  end,
  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  -- on_highlights = function(highlights, colors) end,
  on_highlights = function(hl, _color)
    local prompt = "#FFA630"
    local text = "#488dff"
    local none = "None"

    hl.TelescopeTitle = {
      fg = prompt,
      bg = none,
    }
    hl.TelescopeNormal = {
      bg = none,
      fg = none,
    }
    hl.TelescopeBorder = {
      bg = none,
      fg = none,
    }
    hl.TelescopeMatching = {
      fg = prompt,
      bg = none,
    }
    hl.MsgArea = {
      fg = c.fg_dark,
    }
  end,
})

local highlights = {
  -- Ecovim Colors
  EcovimPrimary                 = { fg = "#488dff" },
  EcovimSecondary               = { fg = "#FFA630" },
  EcovimPrimaryBold             = { bold = true, fg = "#488DFF" },
  EcovimSecondaryBold           = { bold = true, fg = "#FFA630" },
  EcovimHeader                  = { bold = true, fg = "#488DFF" },
  EcovimHeaderInfo              = { bold = true, fg = "#FFA630" },
  EcovimFooter                  = { bold = true, fg = "#FFA630" },
  EcovimNvimTreeTitle           = { bold = true, fg = "#FFA630", bg = "#16161e" },
  -- Lines
  CursorLineNR                  = { link = "EcovimSecondary" },
  LineNr                        = { link = "Comment" },
  -- Floats/Windows
  -- FloatBorder                   = { bg = "None", fg = "#488DFF" },
  -- Pmenu                         = { bg = "None", fg = "#488DFF" },
  -- WhichKeyFloat                 = { bg = "None", fg = "#488DFF" },
  -- BufferTabpageFill             = { fg = "None" },
  BqfPreviewBorder              = { link = "FloatBorder" },
  BufferInactiveIndex           = { link = "BufferInactive" },
  LspInfoBorder                 = { link = "FloatBorder" },
  VertSplit                     = { bg = "NONE", fg = "#16161E" },
  WinSeparator                  = { bg = "NONE", fg = "#16161E" },
  -- Tree
  NvimTreeFolderIcon            = { bg = "None", fg = "None" },
  -- Misc
  GitSignsCurrentLineBlame      = { link = "Comment" },
  -- StatusLine                    = { bg = "None" },
  -- StatusLineNC                  = { bg = "None" },
  rainbowcol1                   = { fg = c.blue, ctermfg = 9 },
  TSRainbowRed                  = { fg = c.blue, ctermfg = 9 },
  RainbowDelimiterRed           = { fg = c.blue, ctermfg = 9 },
  Boolean                       = { fg = "#F7768E" },
  BufferOffset                  = { link = "EcovimSecondary" },
  LspInlayHint                  = { link = "LspCodeLens" },
  -- Bufferline
  BufferLineFill                = { bg = "#16161E", fg = "#565F89" },
  BufferLineTabSelected         = { bg = "#16161E", fg = "#7AA2F7" },
  BufferLineBufferSelected      = { bg = "#16161E", fg = "#C0CAF5", bold = true },
  BufferCurrentSign             = { fg = c.cyan0 },
  BufferInactiveSign            = { bg = "#202331", fg = c.dark3 },
  BufferInactiveMod             = { bg = "NONE", fg = c.yellow },
  -- BufferLineOffsetSeparator     = { bg = "#13141c", fg = "#13141c" },
  -- BufferLineSeparator           = { bg = "#13141c", fg = "#13141c" },
  -- Completion Menu Colors
  CmpItemAbbr                   = { fg = c.dark3, bg = "NONE" },
  CmpItemKindClass              = { fg = c.orange },
  CmpItemKindConstructor        = { fg = c.purple },
  CmpItemKindFolder             = { fg = c.blue2 },
  CmpItemKindFunction           = { fg = c.blue },
  CmpItemKindInterface          = { fg = c.teal, bg = "NONE" },
  CmpItemKindKeyword            = { fg = c.magneta2 },
  CmpItemKindMethod             = { fg = c.red },
  CmpItemKindReference          = { fg = c.red1 },
  CmpItemKindSnippet            = { fg = c.dark3 },
  CmpItemKindVariable           = { fg = c.cyan, bg = "NONE" },
  CmpItemKindText               = { fg = "LightGrey" },
  CmpItemMenu                   = { fg = "#C586C0", bg = "NONE" },
  CmpItemAbbrMatch              = { fg = "#569CD6", bg = "NONE" },
  CmpItemAbbrMatchFuzzy         = { fg = "#569CD6", bg = "NONE" },
  CmpBorderedWindow_FloatBorder = { fg = c.blue0 },
}


for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end

local neovide_highlights = {
  -- VertSplit                   = { bg = "#16161E", fg = "#1A1B26" },
  -- NvimTreeWinSeparator        = { bg = "#16161E", fg = "None" },
  -- WinSeparator                = { bg = "#16161E", fg = "#16161E" },
  -- BufferLineBuffer            = { bg = "#1A1B26", fg = "#1A1B26" },
  -- BufferLineTab               = { bg = "#1A1B26", fg = "#1A1B26" },
  -- BufferLineFill              = { bg = "#1A1B26", fg = "#1A1B26" },
  -- BufferLineTabSelected       = { bg = "#1A1B26", fg = "#7AA2F7" },
  -- BufferLineSeparator         = { bg = "#1A1B26", fg = "#1A1B26" },
  -- BufferTypeSeparator         = { bg = "#1A1B26", fg = "#1A1B26" },
  -- BufferLineOffsetSeparator   = { bg = "#1A1B26", fg = "#1A1B26" },
  -- BufferLineSeparatorSelected = { bg = "#1A1B26", fg = "#1A1B26" },
}

if vim.g.neovide then
  for group, hl in pairs(neovide_highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

-- local fixBufferLineSeparator = function()
--   vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", vim.api.nvim_get_hl_by_name('WinSeparator', true))
--   vim.api.nvim_set_hl(0, "BufferLineSeparator", vim.api.nvim_get_hl_by_name('Separator', true))
-- end
--
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = fixBufferLineSeparator,
-- })

-- fixBufferLineSeparator()
