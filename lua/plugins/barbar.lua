local icons = require('utils.icons')

-- Set barbar's options
require("barbar").setup({
	-- Excludes buffers from the tabline
	exclude_ft = { "qf" },
	icons = {
		buffer_index = true,
		buffer_number = false,
		button = "",
		-- Enables / disables diagnostic symbols
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = false, icon = "ﬀ" },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = false },
		},
		gitsigns = {
			added = { enabled = false, icon = "+" },
			changed = { enabled = false, icon = "~" },
			deleted = { enabled = false, icon = "-" },
		},
		separator = { left = "▎", right = "" },
		modified = { button = "●" },
		pinned = { button = icons.pin, filename = true, separator = { right = "" } },
		alternate = { filetype = { enabled = false } },
		current = { buffer_index = true },
		inactive = { button = nil },
		visible = { modified = { buffer_number = false } },
	},
	-- Set the filetypes which barbar will offset itself for
	sidebar_filetypes = {
		-- Use the default values: {event = 'BufWinLeave', text = nil}
		-- NvimTree = { text = "File Explorer" },
		-- Or, specify the text used for the offset:
		-- undotree = { text = "undotree" },
		-- Or, specify the event which the sidebar executes when leaving:
		-- ["neo-tree"] = { event = "BufWipeout" },
		-- Or, specify both
		-- Outline = { event = "BufWinLeave", text = "symbols-outline" },
	},
})
