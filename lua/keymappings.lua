local keymap = vim.api.nvim_set_keymap;
local opts = { noremap = true, silent = true }
local silent = { silent = true }

-- Better window movement
keymap("n", "<C-h>", "<C-w>h", silent)
keymap("n", "<C-j>", "<C-w>j", silent)
keymap("n", "<C-k>", "<C-w>k", silent)
keymap("n", "<C-l>", "<C-w>l", silent)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Keep visual mode indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Save file by CTRL-S
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<ESC> :w<CR>", opts)

-- Telescope
keymap("n", "<C-p>", "<CMD>lua require('plugins.telescope').project_files()<CR>", { noremap = true })
keymap("n", "<S-p>", "<CMD>lua require('plugins.telescope.pickers.multi-rg')()<CR>", { noremap = true })

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", opts)

-- Find word/file across project
keymap("n", "<Leader>pf", "yiw<CMD>Telescope git_files<CR><C-r>+<ESC>", { noremap = true })
keymap("n", "<Leader>pw", "<CMD>Telescope grep_string<CR><ESC>", { noremap = true })

-- Git
keymap("n", "<Leader>gla", "<CMD>lua require('plugins.telescope').my_git_commits()<CR>", opts)
keymap("n", "<Leader>glc", "<CMD>lua require('plugins.telescope').my_git_bcommits()<CR>", opts)

-- Buffers
keymap("n", "<Tab>", ":BufferNext<CR>", opts)
keymap("n", "gn", ":bn<CR>", opts)
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", opts)
keymap("n", "gp", ":bp<CR>", opts)
keymap("n", "<S-q>", ":BufferClose<CR>", opts)

-- Move between barbar buffers
keymap("n", "<Space>1", ":BufferGoto 1<CR>", silent)
keymap("n", "<Space>2", ":BufferGoto 2<CR>", silent)
keymap("n", "<Space>3", ":BufferGoto 3<CR>", silent)
keymap("n", "<Space>4", ":BufferGoto 4<CR>", silent)
keymap("n", "<Space>5", ":BufferGoto 5<CR>", silent)
keymap("n", "<Space>6", ":BufferGoto 6<CR>", silent)
keymap("n", "<Space>7", ":BufferGoto 7<CR>", silent)
keymap("n", "<Space>8", ":BufferGoto 8<CR>", silent)
keymap("n", "<Space>9", ":BufferGoto 9<CR>", silent)
keymap("n", "<A-1>", ":BufferGoto 1<CR>", silent)
keymap("n", "<A-2>", ":BufferGoto 2<CR>", silent)
keymap("n", "<A-3>", ":BufferGoto 3<CR>", silent)
keymap("n", "<A-4>", ":BufferGoto 4<CR>", silent)
keymap("n", "<A-5>", ":BufferGoto 5<CR>", silent)
keymap("n", "<A-6>", ":BufferGoto 6<CR>", silent)
keymap("n", "<A-7>", ":BufferGoto 7<CR>", silent)
keymap("n", "<A-8>", ":BufferGoto 8<CR>", silent)
keymap("n", "<A-9>", ":BufferGoto 9<CR>", silent)

-- Don't yank on delete char
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)
keymap("v", "x", '"_x', opts)
keymap("v", "X", '"_X', opts)

-- Don't yank on visual paste
keymap("v", "p", '"_dP', opts)

-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd [[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]]

-- Quickfix
keymap("n", "<Space>,", ":cp<CR>", silent)
keymap("n", "<Space>.", ":cn<CR>", silent)

-- Toggle quicklist
keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", { noremap = true, silent = true})

-- Easyalign
keymap("n", "ga", "<Plug>(EasyAlign)", silent)
keymap("x", "ga", "<Plug>(EasyAlign)", silent)

-- Manually invoke speeddating in case switch.vim didn't work
keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", opts)
keymap("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>", opts)

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
end

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", opts)
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", opts)
