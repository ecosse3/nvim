local filter = require("lsp.utils.filter").filter
local filterReactDTS = require("lsp.utils.filterReactDTS").filterReactDTS

require("glance").setup({
	hooks = {
		before_open = function(results, open, jump, method)
			if #results == 1 then
				jump(results[1]) -- argument is optional
			elseif method == "definitions" then
				results = filter(results, filterReactDTS)
				open(results)
			else
				open(results)
			end
		end,
	},
})
