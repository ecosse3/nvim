local present, conflict = pcall(require, "git-conflict")
if not present then
	return
end

conflict.setup({
	default_mappings = true,                           -- disable buffer local mapping created by this plugin
	default_commands = true,                           -- disable commands created by this plugin
	disable_diagnostics = true,                        -- This will disable the diagnostics in a buffer whilst it is conflicted
	highlights = {                                     -- They must have background color, otherwise the default color will be used
		incoming = "DiffText",
		current = "DiffAdd",
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "GitConflictDetected",
	callback = function()
		vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
	end,
})
