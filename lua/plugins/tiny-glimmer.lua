return {
	{
		"rachartier/tiny-glimmer.nvim",
		event = "VeryLazy",
		priority = 10, -- Low priority to catch other plugins' keybindings
		config = function()
			require("tiny-glimmer").setup({
				enabled = true,
				overwrite = {
					-- Search navigation animation
					search = {
						enabled = true,
						default_animation = "pulse",
						next_mapping = "n", -- Key for next match
						prev_mapping = "N", -- Key for previous match
					},

					-- Undo operation animation
					undo = {
						enabled = true,
						default_animation = {
							name = "fade",
							settings = {
								from_color = "DiffDelete",
								max_duration = 500,
								min_duration = 500,
							},
						},
						undo_mapping = "u",
					},
				},
			})
		end,
	},
}
