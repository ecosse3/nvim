function nvim_create_augroups(definitions)
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
}

nvim_create_augroups(autocmds)

vim.cmd([[
  function! CustomFold()
    return printf('   %-6d%s', v:foldend - v:foldstart + 1, getline(v:foldstart))
  endfunction
]])
