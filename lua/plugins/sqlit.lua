return {
	{
		"Maxteabag/sqlit",
		keys = {
			{
				"<leader>D",
				function()
					Snacks.terminal("sqlit --theme textual-ansi")
				end,
				desc = "Database (sqlit)",
			},
		},
	},
}
