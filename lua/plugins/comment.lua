return {
	{
		"echasnovski/mini.comment",
		version = false,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = "VeryLazy",
		config = function()
			-- Setup context commentstring for JSX/TSX support
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})

			require("mini.comment").setup({
				options = {
					-- Use ts_context_commentstring to compute commentstring
					custom_commentstring = function()
						return require("ts_context_commentstring.internal").calculate_commentstring()
							or vim.bo.commentstring
					end,
					-- Whether to ignore blank lines when commenting
					ignore_blank_line = false,
					-- Whether to force single space inner padding
					pad_comment_parts = true,
				},
				-- Uses same keymaps as native nvim commenting:
				-- gc{motion} - Toggle comment (operator)
				-- gcc - Toggle comment on current line
				-- gc - Toggle comment in Visual mode
				-- Supports v:count and dot-repeat
			})
		end,
	},
}
