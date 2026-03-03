return {
	{
		"yetone/avante.nvim",
		enabled = EcoVim.plugins.ai.avante.enabled,
		lazy = false,
		version = false,
		opts = {
			provider = "copilot",
			-- provider = "claude",
			mode = "agentic", -- The default mode for interaction. "agentic" uses tools to automatically generate code, "legacy" uses the old planning method to generate code.
			auto_suggestions_provider = "copilot",
			behaviour = {
				auto_apply_diff_after_generation = false,
				auto_focus_sidebar = true,
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_suggestions = false,
				enable_cursor_planning_mode = true,
				jump_result_buffer_on_finish = false,
				minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
				support_paste_from_clipboard = true,
			},
			hints = { enabled = true },
			providers = {
				copilot = {
					model = "claude-opus-4.5",
					-- model = "grok-code-fast-1",
					disable_tools = false,
					extra_request_body = {
						max_tokens = 200000,
					},
				},
			},
			-- system_prompt as function ensures LLM always has latest MCP server state
			-- This is evaluated for every message, even in existing chats
			system_prompt = function()
				local ok, mcphub = pcall(require, "mcphub")
				if not ok then return "" end
				local hub = mcphub.get_hub_instance()
				return hub and hub:get_active_servers_prompt() or ""
			end,
			-- Using function prevents requiring mcphub before it's loaded
			custom_tools = function()
				local ok, ext = pcall(require, "mcphub.extensions.avante")
				if not ok then return {} end
				return { ext.mcp_tool() }
			end,
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"zbirenbaum/copilot.lua",
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			"MeanderingProgrammer/render-markdown.nvim",
		},
	},
}
