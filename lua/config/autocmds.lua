-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 }) end })
-- Disable diagnostics in node_modules (0 is current buffer only)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell" })
-- Show `` in specific files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.json" },
  command = "setlocal conceallevel=0" })

-- Attach specific keybindings in which-key for specific filetypes
local present, _ = pcall(require, "which-key")
if not present then return end
local _, pwk = pcall(require, "plugins.which-key")

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md",
  callback = function() pwk.attach_markdown(0) end })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.ts", "*.tsx" },
  callback = function() pwk.attach_typescript(0) end })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "package.json" },
  callback = function() pwk.attach_npm(0) end })
vim.api.nvim_create_autocmd("FileType",
  { pattern = "*",
    callback = function()
      if EcoVim.plugins.zen.enabled and vim.bo.filetype ~= "alpha" then
        pwk.attach_zen(0)
      end
    end
  })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*test.js", "*test.ts", "*test.tsx" },
  callback = function() pwk.attach_jest(0) end })
vim.api.nvim_create_autocmd("FileType", { pattern = "spectre_panel",
  callback = function() pwk.attach_spectre(0) end })
vim.api.nvim_create_autocmd("FileType", { pattern = "NvimTree",
  callback = function() pwk.attach_nvim_tree(0) end })
