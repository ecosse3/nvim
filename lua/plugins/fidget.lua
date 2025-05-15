return {
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			progress = {
				display = {
					render_limit = 3,
					done_ttl = 2,
				},
			},
			notification = {
				window = {
					normal_hl = "Comment",
					winblend = 0,
					border = "rounded",
				},
			},
		},
	},
}
