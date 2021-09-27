vim.fn.sign_define("LspDiagnosticsSignError",       { text = " 🞮", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning",     { text = " ▲", numhl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = " ⁈", numhl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint",        { text = " ⯁", numhl = "LspDiagnosticsDefaultHint" })

-- UI just like `:LspInfo` to show which capabilities each attached server has
vim.api.nvim_command("command! LspCapabilities lua require'lsp/capabilities'()")
