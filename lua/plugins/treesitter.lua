return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local function start_ts(buf, lang)
				if not vim.api.nvim_buf_is_valid(buf) then
					return
				end
				vim.treesitter.start(buf, lang)
				-- Fold options are window-local; only apply when this buffer is
				-- the one shown in the current window (async installs finish later).
				if vim.api.nvim_get_current_buf() == buf then
					-- vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo[0][0].foldmethod = "expr"
				end
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "*" },
				callback = function(args)
					local ft = vim.bo[args.buf].filetype
					local lang = vim.treesitter.language.get_lang(ft)
					if not lang then
						return
					end

					-- Parser already available: start immediately.
					if vim.treesitter.language.add(lang) then
						start_ts(args.buf, lang)
						return
					end

					-- Otherwise install it (async) and start once it finishes compiling.
					local available = vim.g.ts_available or require("nvim-treesitter").get_available()
					vim.g.ts_available = available
					if vim.tbl_contains(available, lang) then
						require("nvim-treesitter").install(lang):await(function(err)
							if err then
								return
							end
							vim.schedule(function()
								if vim.treesitter.language.add(lang) then
									start_ts(args.buf, lang)
								end
							end)
						end)
					end
				end,
			})
		end,
		dependencies = {
			"hiphish/rainbow-delimiters.nvim",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPre",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = false, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = true, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				--[[ per_filetype = {
            ["html"] = {
              enable_close = false
            }
          } ]]
			})
		end,
	},

	{
		"m-demare/hlargs.nvim",
		event = "BufReadPre",
		config = function()
			require("hlargs").setup({
				color = "#ff69b4",
				highlight = {},
			})
		end,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	{
		"wurli/contextindent.nvim",
		-- This is the only config option; you can use it to restrict the files
		-- which this plugin will affect (see :help autocommand-pattern).
		opts = { pattern = "*" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
