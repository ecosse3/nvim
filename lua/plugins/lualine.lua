return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lineLengthWarning = 80
			local lineLengthError = 120

			local function lsp_clients()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if #clients == 0 then
					return ""
				end
				local names = {}
				for _, client in ipairs(clients) do
					table.insert(names, client.name)
				end
				return table.concat(names, ", ")
			end

			local function tab_or_spaces()
				if vim.bo.expandtab then
					return "󰄮 " .. vim.bo.shiftwidth
				else
					return "󰄱 " .. vim.bo.shiftwidth
				end
			end

			local function file_icon_name()
				local name = vim.fn.expand("%:p")
				if name == "" then
					return " [No Name]"
				end
				local file = vim.fn.fnamemodify(name, ":t")
				local ext = vim.fn.expand("%:e")
				local icon = require("nvim-web-devicons").get_icon(file, ext, { default = true })
				local display
				if EcoVim.statusline.path_enabled then
					if EcoVim.statusline.path == "relative" then
						display = name:gsub(vim.fn.getcwd() .. "/", "")
					else
						display = vim.fn.fnamemodify(name, ":~:.")
					end
				else
					display = file
				end
				local readonly = vim.bo.readonly and " [-]" or ""
				local modified = vim.bo.modified and " [+]" or ""
				return icon .. " " .. display .. readonly .. modified
			end

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "tokyonight",
					component_separators = "",
					section_separators = { left = "", right = "" },
					globalstatus = true,
					disabled_filetypes = {
						statusline = { "snacks_layout_box" },
					},
					refresh = {
						statusline = 100,
					},
				},
				sections = {
					lualine_a = {
						{
							"mode",
							separator = { left = "" },
							right_padding = 2,
							fmt = function(str)
								return "" .. EcoVim.icons.vim .. " " .. str:upper()
							end,
						},
					},
					lualine_b = {
						{
							function()
								local reg = vim.fn.reg_recording()
								if reg ~= "" then
									return " @" .. reg
								end
								return ""
							end,
							color = { fg = "#FFA630" },
						},
						{
							"branch",
							padding = { right = 1 },
						},
						{
							"diff",
							padding = { left = 0 },
							symbols = {
								added = " ",
								modified = " ",
								removed = " ",
							},
						},
					},
					lualine_c = {
						{
							lsp_clients,
							icon = EcoVim.icons.gears,
						},
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							sections = { "error", "warn", "info", "hint" },
							symbols = {
								error = EcoVim.icons.errorOutline,
								warn = EcoVim.icons.warningTriangleNoBg,
								info = EcoVim.icons.infoOutline,
								hint = EcoVim.icons.lightbulbOutline,
							},
						},
						file_icon_name,
					},
					lualine_x = {
						"encoding",
						{
							"fileformat",
							symbols = {
								unix = "",
								dos = "",
								mac = "",
							},
						},
						"filesize",
						"filetype",
					},
					lualine_y = { "progress" },
					lualine_z = {
						{
							"location",
							left_padding = 2,
							padding = { left = 0, right = 1 },
						},
						{
							function()
								local col = vim.fn.col(".")
								local line_len = vim.fn.strwidth(vim.fn.getline("."))

								if col > lineLengthError then
									return "%#DiagnosticError#" .. col
								elseif col > lineLengthWarning then
									return "%#DiagnosticWarn#" .. col
								end
								return tostring(col)
							end,
							padding = { left = 0, right = 0 },
						},
						{
							function()
								local line_len = vim.fn.strwidth(vim.fn.getline("."))
								if line_len > lineLengthError then
									return "%#DiagnosticError#" .. line_len
								elseif line_len > lineLengthWarning then
									return "%#DiagnosticWarn#" .. line_len
								end
								return tostring(line_len)
							end,
							padding = { left = 0, right = 0 },
						},
						{
							tab_or_spaces,
							separator = { right = "" },
							cond = function()
								return vim.fn.winwidth(0) > 80
							end,
							padding = { left = 1, right = 0 },
						},
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "filetype" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}
