local snippet_trigger_text = ";"

return {
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		version = "1.*",
		dependencies = {
			{
				"saghen/blink.compat",
				opts = { impersonate_nvim_cmp = true },
			},
			"rafamadriz/friendly-snippets",
			"fang2hou/blink-copilot",
			"David-Kunz/cmp-npm",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load({
						paths = { vim.fn.stdpath("config") .. "/snippets" },
					})
				end,
			},
		},

		-- use a release tag to download pre-built binaries
		-- version = 'v0.*',
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		opts = {
			enabled = function()
				-- Disable in snacks picker windows
				local ft = vim.bo.filetype
				if ft == "snacks_picker_list" or ft == "snacks_picker_input" or ft:match("^snacks_picker") or ft == "sql" then
					return false
				end
				return "force"
			end,
			cmdline = {
				enabled = true,
			},
			term = {},

			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.
			keymap = {
				preset = "super-tab",
				["<Tab>"] = {
					function(cmp)
						if vim.b[vim.api.nvim_get_current_buf()].nes_state then
							cmp.hide()
							return (
								require("copilot-lsp.nes").apply_pending_nes()
								and require("copilot-lsp.nes").walk_cursor_end_edit()
							)
						end
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<S-k>"] = { "scroll_documentation_up", "fallback" },
				["<S-j>"] = { "scroll_documentation_down", "fallback" },
				["<C-Space>"] = {
					function(cmp)
						cmp.show()
					end,
				},
			},

			snippets = {
				preset = "luasnip",
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},

			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
					"copilot",
					"avante_commands",
					"avante_mentions",
					"avante_files",
				},

				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						opts = {
							max_completions = 3,
							max_attempts = 4,
						},
						score_offset = 100,
						async = true,
						transform_items = function(_, items)
							local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
							local kind_idx = #CompletionItemKind + 1
							CompletionItemKind[kind_idx] = "Copilot"
							for _, item in ipairs(items) do
								item.kind = kind_idx
							end
							return items
						end,
					},
					buffer = {
						-- opts = {
						-- 	max_items = 10,
						-- },
						max_items = 10,
					},
					avante_commands = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 90, -- show at a higher priority than lsp
						opts = {},
					},
					avante_files = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 100, -- show at a higher priority than lsp
						opts = {},
					},
					avante_mentions = {
						name = "avante_mentions",
						module = "blink.compat.source",
						score_offset = 1000, -- show at a higher priority than lsp
						opts = {},
					},
					npm = {
						name = "npm",
						module = "blink.compat.source",
						score_offset = -3,
						opts = {
							ignore = {},
							only_semantic_versions = false,
						},
					},
				},
			},

			completion = {
				list = {
					max_items = 20,
				},
				trigger = {
					show_on_insert = true,
					show_on_keyword = true,
					-- When true, will show the completion window after typing a trigger character
					show_on_trigger_character = true,
					-- When both this and show_on_trigger_character are true, will show the completion window
					-- when the cursor comes after a trigger character when entering insert mode
					show_on_insert_on_trigger_character = true,
					-- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won't trigger
					-- the completion window when the cursor comes after a trigger character when
					-- entering insert mode/accepting an item
					show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
					-- or a function, similar to show_on_blocked_trigger_character
          prefetch_on_insert = false
				},
				menu = {
					auto_show = true,
					border = EcoVim.ui.float.border,
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
						treesitter = {},
					},
				},

				-- experimental auto-brackets support
				accept = {
					auto_brackets = { enabled = false },
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					treesitter_highlighting = true,
					window = {
						border = EcoVim.ui.float.border,
					},
				},

				ghost_text = {
					enabled = true,
				},
			},

			signature = {
				enabled = true,
				window = {
					border = EcoVim.ui.float.border,
				},
			},

			appearance = {
				kind_icons = {
					Copilot = "",
					Text = "󰉿",
					Method = "󰊕",
					Function = "󰊕",
					Constructor = "󰒓",

					Field = "󰜢",
					Variable = "󰆦",
					Property = "󰖷",

					Class = "󱡠",
					Interface = "󱡠",
					Struct = "󱡠",
					Module = "󰅩",

					Unit = "󰪚",
					Value = "󰦨",
					Enum = "󰦨",
					EnumMember = "󰦨",

					Keyword = "󰻾",
					Constant = "󰏿",

					Snippet = "󱄽",
					Color = "󰏘",
					File = "󰈔",
					Reference = "󰬲",
					Folder = "󰉋",
					Event = "󱐋",
					Operator = "󰪚",
					TypeParameter = "󰬛",
				},
			},
		},
		-- allows extending the enabled_providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},

	-- LSP servers and clients communicate what features they support through "capabilities".
	--  By default, Neovim support a subset of the LSP specification.
	--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
	--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
	--
	-- This can vary by config, but in general for nvim-lspconfig:
}
