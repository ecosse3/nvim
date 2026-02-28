return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		},
		opts = {
			char = {
				keys = { "f", "F", "t", "T" },
			},
			highlight = {
				backdrop = false,
			},
			jump = {
				autojump = true,
				nohlsearch = true,
			},
			modes = {
				char = {
					char_actions = function()
						return {
							[";"] = "next",
							["F"] = "left",
							["f"] = "right",
						}
					end,
					enabled = true,
					keys = { "f", "F", "t", "T", ";" },
					highlight = {
						backdrop = false,
					},
					jump_labels = false,
					multi_line = true,
				},
				search = {
					enabled = true,
					highlight = {
						backdrop = false,
					},
					jump = {
						autojump = false,
					},
				},
			},
			prompt = {
				win_config = { border = "none" },
			},
			search = {
				wrap = true,
			},
		},
	},
}
