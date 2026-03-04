--[[
  ╔══════════════════════════════════════════════════════════════════╗
  ║                    ECOVIM DEFAULT CONFIGURATION                  ║
  ╠══════════════════════════════════════════════════════════════════╣
  ║                                                                  ║
  ║  ⚠️  DO NOT MODIFY THIS FILE DIRECTLY!                          ║
  ║                                                                  ║
  ║  This file contains DEFAULT settings for EcoVim.                ║
  ║  It is maintained by the project author.                        ║
  ║                                                                  ║
  ║  👉 FOR CUSTOMIZATION, CREATE: lua/config/user.lua              ║
  ║     (Copy from: lua/config/user.lua.example)                    ║
  ║                                                                  ║
  ║  📖 HOW CONFIGURATION WORKS:                                    ║
  ║                                                                  ║
  ║     Step 1: This file loads with default values                 ║
  ║         ↓                                                       ║
  ║     Step 2: Your user.lua loads (if it exists)                  ║
  ║         ↓                                                       ║
  ║     Step 3: Your settings override the defaults                 ║
  ║                                                                  ║
  ║  ✅ This system ensures:                                        ║
  ║     • You can update EcoVim anytime (git pull)                  ║
  ║     • Your personal settings are never overwritten              ║
  ║     • No merge conflicts when updating                          ║
  ║                                                                  ║
  ╚══════════════════════════════════════════════════════════════════╝
--]]

local icons = require("utils.icons")

EcoVim = {
	-- Theme Configuration
	colorscheme = "tokyonight-night",

	-- UI Settings
	ui = {
		font = { "FiraCode Nerd Font", ":h14" },
		float = { border = "rounded" },
	},

	-- Plugin Settings
	plugins = {
		ai = {
			avante = { enabled = true },
			copilot = { enabled = true },
			opencode = { enabled = true },
		},
		completion = {
			select_first_on_enter = false,
			ghost_text = true,
		},
		jump_by_subwords = {
			enabled = false,
		},
		rooter = {
			-- Monorepo root markers (turbo, nx, pnpm, lerna, rush) are listed before .git
			-- so monorepo roots are preferred over plain git repos.
			-- Note: package.json is intentionally excluded to avoid sub-package detection in monorepos
			patterns = {
				"pnpm-workspace.yaml",
				"turbo.json",
				"nx.json",
				"lerna.json",
				"rush.json",
				".git",
				"_darcs",
				".bzr",
				".svn",
				"Makefile",
			},
		},
		projects = {
			-- Directories to scan for projects (sub-folders matching patterns)
			dev = { "~/Projects", "~/.config" },
			-- Patterns to detect project root directories
			patterns = { ".git" },
		},
	},

	-- LSP Configuration (add servers in user.lua)
	lsp = {
		ensure_installed = {},
		exclude = { "ts_ls", "copilot" },
		servers = {},
		format_on_save = false,
		inlay_hints = true,
	},

	-- Formatting Configuration (override in user.lua)
	formatters = {},

	-- Linting Configuration (override in user.lua)
	linters = {},

	-- Keymap Configuration (disable keys in user.lua)
	keys = {},

	-- Autocmd Configuration (add in user.lua)
	autocmds = {},

	-- Plugin Override Functions (define in user.lua)
	plugin_overrides = {},

	-- Statusline Configuration
	statusline = {
		path_enabled = false,
		path = "relative",
	},

	-- Icons (required)
	icons = icons,
}

--[[
  ╔══════════════════════════════════════════════════════════════════╗
  ║                    LOAD USER CONFIGURATION                       ║
  ╚══════════════════════════════════════════════════════════════════╝
--]]

local user_config = vim.fn.stdpath("config") .. "/lua/config/user.lua"
if vim.uv.fs_stat(user_config) then
	local ok, err = pcall(dofile, user_config)
	if not ok then
		vim.notify("Error loading user config: " .. err, vim.log.levels.ERROR, { title = "EcoVim" })
	end
end
