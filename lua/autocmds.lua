local function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup '..group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

local autocmds = {
  lua_highlight = {
    { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]] };
  };
  auto_update_plugins = {
    { "BufWritePost", "plugins.lua", [[source <afile> | PackerSync]] };
  };
  disable_lsp_node_modules = {
    { "BufRead", "*/node_modules/*", [[lua vim.diagnostic.disable(0)]] };
    { "BufNewFile", "*/node_modules/*", [[lua vim.diagnostic.disable(0)]] };
  };
}

nvim_create_augroups(autocmds)
