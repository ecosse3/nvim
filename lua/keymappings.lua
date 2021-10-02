-- Better scape
vim.api.nvim_set_keymap("n", "jk", "<Esc>", { noremap = true})
vim.api.nvim_set_keymap("v", "jk", "<Esc>", { noremap = true})
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true})

-- Better window movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })

-- Keep visual mode indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Save file by CTRL-S
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<ESC> :w<CR>", { noremap = true, silent = true })

-- Make work uppercase
vim.api.nvim_set_keymap("n", "<C-u>", "viwU<ESC>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-u>", "<ESC>viwUi", { noremap = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<C-p>", "<CMD>Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-p>", "<CMD>Telescope live_grep<CR>", { noremap = true })

-- Remove highlights
vim.api.nvim_set_keymap("n", "<CR>", ":noh<CR><CR>", { noremap = true, silent = true })

-- Find word/file across project
vim.api.nvim_set_keymap("n", "<Leader>pf", "yiw<CMD>Telescope find_files<CR><C-r>+<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>pw", "<CMD>Telescope grep_string<CR><ESC>", { noremap = true })

-- Git
vim.api.nvim_set_keymap("n", "<Leader>gla", "<CMD>lua require('plugins.telescope').my_git_commits()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>glc", "<CMD>lua require('plugins.telescope').my_git_bcommits()<CR>", { noremap = true, silent = true })

-- Buffers
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gn", ":bn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gp", ":bp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-q>", ":BufferClose<CR>", { noremap = true, silent = true })

-- Move between barbar buffers
vim.api.nvim_set_keymap("n", "<Space>1", ":BufferGoto 1<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>2", ":BufferGoto 2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>3", ":BufferGoto 3<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>4", ":BufferGoto 4<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>5", ":BufferGoto 5<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>6", ":BufferGoto 6<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>7", ":BufferGoto 7<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>8", ":BufferGoto 8<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>9", ":BufferGoto 9<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-1>", ":BufferGoto 1<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-2>", ":BufferGoto 2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-3>", ":BufferGoto 3<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-4>", ":BufferGoto 4<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-5>", ":BufferGoto 5<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-6>", ":BufferGoto 6<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-7>", ":BufferGoto 7<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-8>", ":BufferGoto 8<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-9>", ":BufferGoto 9<CR>", { silent = true })

-- Don't yank on delete char
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "X", '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "x", '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "X", '"_X', { noremap = true, silent = true })

-- Yank until the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd [[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]]

-- Quickfix
vim.api.nvim_set_keymap("n", "<Space>,", ":cn<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>.", ":cn<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>cc", ":cclose<CR>", { silent = true })

-- Easyalign
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { silent = true })
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { silent = true })

-- Manually invoke speeddating in case switch.vim didn't work
vim.api.nvim_set_keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>", { noremap = true, silent = true })

-- VSnip
vim.cmd [[
  imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
]]

-- Space to NOP to prevent Leader issues
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })

-- Open links under cursor in browser with gx
vim.api.nvim_set_keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", { silent = true })
