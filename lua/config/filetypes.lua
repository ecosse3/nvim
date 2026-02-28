-- Custom filetype detection
vim.filetype.add({
	extension = {
		tfvars = "terraform",
		tfstate = "json",
	},
	filename = {
		[".terraformrc"] = "terraform",
		["terraform.rc"] = "terraform",
	},
	pattern = {
		[".*%.tfvars"] = "terraform",
		[".*%.tfstate"] = "json",
	},
})
