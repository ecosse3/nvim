local keymap = vim.keymap.set
local silent = { silent = true }

table.unpack = table.unpack or unpack -- 5.1 compatibility

-- Fix moving forward in jumplist via <C-i> and <D-i>
keymap("n", "<C-I>", "<C-I>", silent)
keymap("n", "<D-I>", "<C-I>", silent)

-- Add down/up mapping for Cmd
keymap("n", "<D-d>", "<C-d>", silent)
keymap("n", "<D-u>", "<C-u>", silent)

-- H to move to the first non-blank character of the line
keymap("n", "H", "^", silent)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
keymap("x", "J", ":move '>+1<CR>gv-gv", silent)

-- Keep visual mode indenting
keymap("v", "<", "<gv", silent)
keymap("v", ">", ">gv", silent)

-- Case change in visual mode
keymap("v", "`", "u", silent)
keymap("v", "<A-`>", "U", silent)

-- Jump to beginning with backspace
keymap("n", "<BS>", "^", silent)

-- Save file by CTRL-S/CMD-S
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("n", "<D-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)
keymap("i", "<D-s>", "<ESC> :w<CR>", silent)

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", silent)

-- Buffers
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", silent)
keymap("n", "gn", ":bn<CR>", silent)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", silent)
keymap("n", "<F19>", ":BufferLineCyclePrev<CR>", silent)
keymap("n", "gp", ":bp<CR>", silent)
keymap("n", "<S-q>", ":lua Snacks.bufdelete()<CR>", silent)
keymap("n", "<D-q>", ":lua Snacks.bufdelete()<CR>", silent)
keymap("n", "<D-w>", ":lua Snacks.bufdelete()<CR>", silent)

-- Don't yank on delete char
keymap("n", "x", '"_x', silent)
keymap("n", "X", '"_X', silent)
keymap("v", "x", '"_x', silent)
keymap("v", "X", '"_X', silent)

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- Avoid issues because of remapping <c-a> and <c-x> below
-- vim.cmd([[
--   nnoremap <Plug>SpeedDatingFallbackUp <c-a>
--   nnoremap <Plug>SpeedDatingFallbackDown <c-x>
-- ]])

-- Quickfix
keymap("n", "<Leader>,", ":cp<CR>", silent)
keymap("n", "<Leader>.", ":cn<CR>", silent)

-- Toggle quicklist
keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- Manually invoke speeddating in case switch.vim didn't work
-- keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", silent)
-- keymap("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>",
--   silent)

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
end

-- Adjust font size
keymap("n", "<M-=>", function() require('utils').adjust_font_size(1) end, silent)
keymap("n", "<M-->", function() require('utils').adjust_font_size(-1) end, silent)

-- Incremental selection (replacement for the removed nvim-treesitter `incremental_selection` module).
-- Neovim 0.12 ships native visual-mode `an` / `in`, but mini.ai overrides those two keys (around/inside
-- NEXT object), so we call the native implementation directly instead of replaying `an` / `in`.
-- Buffer-local, only for real file buffers with a treesitter parser, so <CR>/<Tab> keep working
-- normally in quickfix, pickers, the dashboard, etc.
local function ts_select(fn)
  return function()
    local ok, select = pcall(require, "vim.treesitter._select") -- private module, may change between versions
    if ok and vim.treesitter.get_parser(nil, nil, { error = false }) then
      select[fn](vim.v.count1)
    else
      vim.lsp.buf.selection_range(fn == "select_parent" and vim.v.count1 or -vim.v.count1)
    end
  end
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("EcoVimIncrementalSelection", { clear = true }),
  callback = function(args)
    if vim.bo[args.buf].buftype ~= "" or not vim.treesitter.language.get_lang(vim.bo[args.buf].filetype) then
      return
    end
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
    end
    -- init_selection: clear search highlight, enter visual mode, select the node under the cursor
    map("n", "<CR>", function()
      vim.cmd("nohlsearch")
      vim.cmd("normal! v")
      ts_select("select_parent")()
    end, "Init node selection")
    map("x", "<CR>", ts_select("select_parent"), "Expand selection to parent node") -- scope_incremental
    map("x", "<Tab>", ts_select("select_parent"), "Expand selection to parent node") -- node_incremental
    map("x", "<S-Tab>", ts_select("select_child"), "Shrink selection to child node") -- node_decremental
  end,
})
