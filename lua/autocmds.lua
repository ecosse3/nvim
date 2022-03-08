vim.api.nvim_create_augroup("AutoUpdatePlugins", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "plugins.lua", command = "source <afile> | PackerSync", group = 'AutoUpdatePlugins' })

vim.api.nvim_create_augroup("Highlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", { command = "silent! lua vim.highlight.on_yank() {higroup='IncSearch', timeout=400}", group = 'Highlight' })

vim.api.nvim_create_augroup("LspNodeModules", { clear = true })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)", group = 'LspNodeModules' })
vim.api.nvim_create_autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)", group = 'LspNodeModules' })
