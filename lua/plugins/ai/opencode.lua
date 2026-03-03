return {
	{
		"sudo-tee/opencode.nvim",
    enabled = EcoVim.plugins.ai.opencode.enabled,
		config = function()
			require("opencode").setup({})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
			"saghen/blink.cmp",
			"folke/snacks.nvim",
		},
	},
}
