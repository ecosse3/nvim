-- Errors
vim.highlight.create('LspDiagnosticsVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);
vim.highlight.create('DiagnosticVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);

-- Warnings
vim.highlight.create('LspDiagnosticsVirtualTextWarning', { guifg = "Yellow", ctermfg = "Yellow" }, false);
vim.highlight.create('DiagnosticVirtualTextWarn', { guifg = "Yellow", ctermfg = "Yellow" }, false);

-- Info & Hints
vim.highlight.create('DiagnosticVirtualTextInfo', { guifg = "White", ctermfg = "White" }, false);
vim.highlight.create('DiagnosticVirtualTextHint', { guifg = "White", ctermfg = "White" }, false);

-- Cursor line
vim.highlight.create('CursorLineNR', { guifg = "Yellow", ctermfg = "Yellow", guibg = "None", cterm = "bold" }, false);

-- Comment in italics
vim.highlight.create('Comment', { gui = "italic", cterm = "italic" }, false);

-- Colorscheme config
vim.g.nightflyCursorColor         = 0
vim.g.nightflyUnderlineMatchParen = 0
vim.g.nightflyNormalFloat         = 1
