local keymap = vim.api.nvim_set_keymap;

-- Better window movement
keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })

-- Keep visual mode indenting
keymap("v", "<", "<gv", { noremap = true, silent = true })
keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Save file by CTRL-S
keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
keymap("i", "<C-s>", "<ESC> :w<CR>", { noremap = true, silent = true })

-- Faster way to escpape in insert mode
keymap("i", "kj", "<ESC>", { noremap = true, silent = true })
keymap("i", "jk", "<ESC>", { noremap = true, silent = true })

-- Telescope
keymap("n", "<leader>ff", "<CMD>lua require('plugins.telescope').project_files()<CR>", { noremap = true })
keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { noremap = true })

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", { noremap = true, silent = true })

-- Find word/file across project
keymap("n", "<Leader>pf", "yiw<CMD>Telescope git_files<CR><C-r>+<ESC>", { noremap = true })
keymap("n", "<Leader>pw", "<CMD>Telescope grep_string<CR><ESC>", { noremap = true })

-- Git
keymap("n", "<Leader>gla", "<CMD>lua require('plugins.telescope').my_git_commits()<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>glc", "<CMD>lua require('plugins.telescope').my_git_bcommits()<CR>", { noremap = true, silent = true })

-- Buffers
keymap("n", "<Tab>", ":BufferNext<CR>", { noremap = true, silent = true })
keymap("n", "gn", ":bn<CR>", { noremap = true, silent = true })
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true })
keymap("n", "gp", ":bp<CR>", { noremap = true, silent = true })
keymap("n", "<S-q>", ":BufferClose<CR>", { noremap = true, silent = true })

-- Move between barbar buffers
keymap("n", "<Space>1", ":BufferGoto 1<CR>", { silent = true })
keymap("n", "<Space>2", ":BufferGoto 2<CR>", { silent = true })
keymap("n", "<Space>3", ":BufferGoto 3<CR>", { silent = true })
keymap("n", "<Space>4", ":BufferGoto 4<CR>", { silent = true })
keymap("n", "<Space>5", ":BufferGoto 5<CR>", { silent = true })
keymap("n", "<Space>6", ":BufferGoto 6<CR>", { silent = true })
keymap("n", "<Space>7", ":BufferGoto 7<CR>", { silent = true })
keymap("n", "<Space>8", ":BufferGoto 8<CR>", { silent = true })
keymap("n", "<Space>9", ":BufferGoto 9<CR>", { silent = true })
keymap("n", "<A-1>", ":BufferGoto 1<CR>", { silent = true })
keymap("n", "<A-2>", ":BufferGoto 2<CR>", { silent = true })
keymap("n", "<A-3>", ":BufferGoto 3<CR>", { silent = true })
keymap("n", "<A-4>", ":BufferGoto 4<CR>", { silent = true })
keymap("n", "<A-5>", ":BufferGoto 5<CR>", { silent = true })
keymap("n", "<A-6>", ":BufferGoto 6<CR>", { silent = true })
keymap("n", "<A-7>", ":BufferGoto 7<CR>", { silent = true })
keymap("n", "<A-8>", ":BufferGoto 8<CR>", { silent = true })
keymap("n", "<A-9>", ":BufferGoto 9<CR>", { silent = true })

-- Don't yank on delete char
keymap("n", "x", '"_x', { noremap = true, silent = true })
keymap("n", "X", '"_X', { noremap = true, silent = true })
keymap("v", "x", '"_x', { noremap = true, silent = true })
keymap("v", "X", '"_X', { noremap = true, silent = true })

-- Don't yank on visual paste
keymap("v", "p", '"_dP', { noremap = true, silent = true })

-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd [[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]]

-- Quickfix
keymap("n", "<Space>,", ":cp<CR>", { silent = true })
keymap("n", "<Space>.", ":cn<CR>", { silent = true })

-- Toggle quicklist
keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", { noremap = true, silent = true})

-- Easyalign
keymap("n", "ga", "<Plug>(EasyAlign)", { silent = true })
keymap("x", "ga", "<Plug>(EasyAlign)", { silent = true })

-- Manually invoke speeddating in case switch.vim didn't work
keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", { noremap = true, silent = true })
keymap("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>", { noremap = true, silent = true })

-- Space to NOP to prevent Leader issues
keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", { silent = true })
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", { silent = true })
end

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
