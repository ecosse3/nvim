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

---@class EcoVimAI
---@field enabled boolean

---@class EcoVimPluginsAI
---@field avante EcoVimAI
---@field copilot EcoVimAI
---@field opencode EcoVimAI

---@class EcoVimPluginsCompletion
---@field select_first_on_enter boolean Select first completion item when pressing Enter
---@field ghost_text boolean Show inline completion preview (ghost text)

---@class EcoVimPluginsJumpBySubwords
---@field enabled boolean

---@class EcoVimPluginsGit
---@field blame_line boolean Show inline git blame on current line

---@class EcoVimPluginsRooter
---@field patterns string[] Root detection patterns for vim-rooter

---@class EcoVimPluginsProjects
---@field dev string[] Directories to scan for projects
---@field patterns string[] Patterns to detect project root directories

---@class EcoVimPlugins
---@field ai EcoVimPluginsAI AI plugin toggles
---@field completion EcoVimPluginsCompletion Completion settings
---@field jump_by_subwords EcoVimPluginsJumpBySubwords
---@field git EcoVimPluginsGit Git integration settings
---@field rooter EcoVimPluginsRooter Root detection settings
---@field projects EcoVimPluginsProjects Project management settings

---@class EcoVimUIFloat
---@field border "rounded"|"single"|"double"|"shadow"|"none" Floating window border style

---@class EcoVimUI
---@field font string[] GUI font settings (e.g. { "FiraCode Nerd Font", ":h14" })
---@field float EcoVimUIFloat Floating window settings

---@class EcoVimLSPServerConfig
---@field cmd? string[] Command to start the server
---@field filetypes? string[] File types the server handles
---@field root_markers? string[] Root directory markers
---@field settings? table Server-specific settings

---@class EcoVimLSP
---@field typescript_server "tsgo"|"ts_ls" TypeScript server: "tsgo" (fast, native) or "ts_ls" (classic)
---@field ensure_installed string[] Additional LSP servers to install via Mason
---@field exclude string[] LSP servers to not auto-enable
---@field servers table<string, EcoVimLSPServerConfig> Custom LSP server configurations
---@field format_on_save boolean Auto-format on save (toggle at runtime with :LspToggleAutoFormat)
---@field inlay_hints boolean Show inlay hints from LSP servers

---@class EcoVimStatusline
---@field path_enabled boolean Show file path in statusline
---@field path "relative"|"absolute" Path display style

---@class EcoVimAutocmd
---@field event string|string[] Trigger event(s)
---@field pattern? string|string[] File pattern(s)
---@field command? string Vim command to run
---@field callback? function Lua callback to run

---@class EcoVimConfig
---@field colorscheme string Theme name (e.g. "tokyonight-night")
---@field ui EcoVimUI UI settings
---@field plugins EcoVimPlugins Plugin settings
---@field lsp EcoVimLSP LSP configuration
---@field formatters table<string, string[]> Override formatters per filetype
---@field linters table<string, string[]> Override linters per filetype
---@field keys table<string, false> Disable default keymaps by setting to false
---@field autocmds table<string, EcoVimAutocmd> Custom autocommands
---@field plugin_overrides table<string, function|table> Override any plugin configuration
---@field statusline EcoVimStatusline Statusline configuration
---@field icons table<string, string> Icon definitions

---@type EcoVimConfig
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
		git = {
			blame_line = true,
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
		-- TypeScript LSP server: "tsgo" (experimental, fast) or "ts_ls" (stable, traditional)
		typescript_server = "tsgo",
		ensure_installed = {},
		exclude = { "copilot" },
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
