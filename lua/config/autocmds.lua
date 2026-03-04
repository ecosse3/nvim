-- Highlight on yank
local yank_group = vim.api.nvim_create_augroup("ecovim_yank_highlight", {})
vim.api.nvim_create_autocmd("TextYankPost",
  { group = yank_group, callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 }) end })
-- Disable diagnostics in node_modules (0 is current buffer only)
local buf_settings_group = vim.api.nvim_create_augroup("ecovim_buf_settings", {})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { group = buf_settings_group, pattern = "*/node_modules/*", command = "lua vim.diagnostic.enable(false, { bufnr = 0 })" })
-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { group = buf_settings_group, pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell" })
-- Show `` in specific files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { group = buf_settings_group, pattern = { "*.txt", "*.md", "*.json" },
  command = "setlocal conceallevel=0" })

-- Attach specific keybindings in which-key for specific filetypes
local wk_present, _ = pcall(require, "which-key")
if wk_present then
  local pwk_present, pwk = pcall(require, "plugins.which-key.setup")
  if not pwk_present then return end

  local wk_group = vim.api.nvim_create_augroup("ecovim_whichkey_ft", {})
  vim.api.nvim_create_autocmd("BufEnter", { group = wk_group, pattern = "*.md",
    callback = function() pwk.attach_markdown(0) end })
  vim.api.nvim_create_autocmd("BufEnter", { group = wk_group, pattern = { "package.json" },
    callback = function() pwk.attach_npm(0) end })
  vim.api.nvim_create_autocmd("BufEnter", { group = wk_group, pattern = { "*.test.js", "*.test.ts", "*.test.tsx", "*.spec.js", "*.spec.ts", "*.spec.tsx" },
    callback = function() pwk.attach_jest(0) end })
  vim.api.nvim_create_autocmd("FileType", { group = wk_group, pattern = "spectre_panel",
    callback = function() pwk.attach_spectre(0) end })

  -- Attach TypeScript keybindings when tsgo or ts_ls connects
  local ts_servers = { tsgo = true, ts_ls = true }
  vim.api.nvim_create_autocmd("LspAttach", {
    group = wk_group,
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and ts_servers[client.name] then
        pwk.attach_typescript(args.buf)
      end
    end,
  })
end

-- File Type Plugin Lazy Loading
local lazy_group = vim.api.nvim_create_augroup("lazy_ft", {})
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  {
    group = lazy_group,
    pattern = { "*.test.ts", "*.test.tsx", "*.spec.ts", "*.spec.tsx", "*.test.js", "*.spec.js" },
    callback = function()
      require("lazy.loader").load({
        plugins = { "neotest", }
      })
    end
  }
)

-- Load user custom autocmds from EcoVim.autocmds
if EcoVim.autocmds then
  local user_group = vim.api.nvim_create_augroup("ecovim_user_autocmds", {})
  for name, config in pairs(EcoVim.autocmds) do
    vim.api.nvim_create_autocmd(config.event, {
      group = config.group or user_group,
      pattern = config.pattern,
      command = config.command,
      callback = config.callback,
      desc = "EcoVim: " .. name,
    })
  end
end
