-- https://github.com/mrjones2014/smart-splits.nvim

local ok, splits = pcall(require, 'smart-splits')
if not ok then
	vim.notify("smart splits not installed")
	return
end
local keymap = vim.keymap.set

splits.setup({
	-- Ignored filetypes (only while resizing)
	ignored_filetypes = {
		'nofile',
		'quickfix',
		'prompt',
	},
	-- Ignored buffer types (only while resizing)
	ignored_buftypes = { 'NvimTree' },
	resize_mode = {
		quit_key = {
			quit_key = '<ESC>',
			resize_keys = { 'h', 'j', 'k', 'l' },
		},
		hooks = {
			on_leave = function()
				require("bufresize").register()
			end,
		}
	},
	ignored_events = {
		'BufEnter',
		'WinEnter',
	},
	tmux_integration = true,
	disable_tmux_nav_when_zoomed = true,
})

-- resizing splits
keymap("n", '<A-h>', splits.resize_left)
keymap("n", '<A-j>', splits.resize_down)
keymap("n", '<A-k>', splits.resize_up)
keymap("n", '<A-l>', splits.resize_right)
-- moving between splits
keymap("n", '<C-h>', splits.move_cursor_left)
keymap("n", '<C-j>', splits.move_cursor_down)
keymap("n", '<C-k>', splits.move_cursor_up)
keymap("n", '<C-l>', splits.move_cursor_right)
