require('cinnamon').setup {
  default_keymaps = false,   -- Enable default keymaps.
  extra_keymaps = false,    -- Enable extra keymaps.
  extended_keymaps = false, -- Enable extended keymaps.
  centered = true,    -- Keep cursor centered in window when using window scrolling.
  disable = false,    -- Disable the plugin.
  scroll_limit = 150, -- Max number of lines moved before scrolling is skipped.
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Keymappings                                              │
-- ╰──────────────────────────────────────────────────────────╯

-- Half-window movements:
vim.keymap.set({ 'n', 'x', 'i' }, '<C-u>', "<Cmd>lua Scroll('<C-u>')<CR>")
vim.keymap.set({ 'n', 'x', 'i' }, '<C-d>', "<Cmd>lua Scroll('<C-d>')<CR>")

-- Page movements:
vim.keymap.set('n', '<PageUp>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
vim.keymap.set('n', '<PageDown>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")

-- Paragraph movements:
vim.keymap.set({ 'n', 'x' }, '{', "<Cmd>lua Scroll('{', 0)<CR>")
vim.keymap.set({ 'n', 'x' }, '}', "<Cmd>lua Scroll('}', 0)<CR>")

-- Previous/next search result:
vim.keymap.set('n', 'n', "<Cmd>lua Scroll('n')<CR>")
vim.keymap.set('n', 'N', "<Cmd>lua Scroll('N')<CR>")
vim.keymap.set('n', '*', "<Cmd>lua Scroll('*')<CR>")
vim.keymap.set('n', '#', "<Cmd>lua Scroll('#')<CR>")
vim.keymap.set('n', 'g*', "<Cmd>lua Scroll('g*')<CR>")
vim.keymap.set('n', 'g#', "<Cmd>lua Scroll('g#')<CR>")

-- Window scrolling:
vim.keymap.set('n', 'zz', "<Cmd>lua Scroll('zz', 0, 1)<CR>")
vim.keymap.set('n', 'zt', "<Cmd>lua Scroll('zt', 0, 1)<CR>")
vim.keymap.set('n', 'zb', "<Cmd>lua Scroll('zb', 0, 1)<CR>")
vim.keymap.set('n', 'z.', "<Cmd>lua Scroll('z.', 0, 1)<CR>")
vim.keymap.set('n', 'z<CR>', "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
vim.keymap.set('n', 'z-', "<Cmd>lua Scroll('z-', 0, 1)<CR>")
vim.keymap.set('n', 'z^', "<Cmd>lua Scroll('z^', 0, 1)<CR>")
vim.keymap.set('n', 'z+', "<Cmd>lua Scroll('z+', 0, 1)<CR>")
