-- typescript hover popup with dynamic verbosity that can be increased with +
local function set_keys(keys, buf, rhs)
	for _, lhs in ipairs(keys) do
		vim.keymap.set("n", lhs, rhs, { buffer = buf })
	end
end

local function del_keys(keys, buf)
	for _, lhs in ipairs(keys) do
		pcall(vim.keymap.del, "n", lhs, { buffer = buf })
	end
end

-- insert a blank line after a closing ``` fence so following text isn't glued to the code block
local function pad_after_code_fences(lines)
	local padded = {}
	local in_fence = false
	for i, line in ipairs(lines) do
		table.insert(padded, line)
		if line:match("^```") then
			in_fence = not in_fence
			if not in_fence and lines[i + 1] ~= nil and lines[i + 1] ~= "" then
				table.insert(padded, "")
			end
		end
	end
	return padded
end

local function hover_set_contents(orig_buf, params, popup_buf, popup_win, res)
	if res == nil then
		return
	end
	local contents = pad_after_code_fences(vim.split(res.contents.value, "\n"))
	local plusMinusOpts = ""
	if params.verbosityLevel > 0 then
		plusMinusOpts = plusMinusOpts .. "[-]"

		set_keys({ "-", "<kMinus>" }, popup_buf, function()
			params.verbosityLevel = params.verbosityLevel - 1
			vim.schedule(function()
				vim.lsp.buf_request(orig_buf, "textDocument/hover", params, function(err, res)
					hover_set_contents(orig_buf, params, popup_buf, popup_win, res)
				end)
			end)
		end)
	elseif params.hadPlus then
		del_keys({ "-", "<kMinus>" }, popup_buf)
		params.hadPlus = false
	end
	if res.canIncreaseVerbosity then
		plusMinusOpts = plusMinusOpts .. "[+]"

		set_keys({ "+", "<kPlus>" }, popup_buf, function()
			params.verbosityLevel = params.verbosityLevel + 1
			params.hadPlus = true
			vim.schedule(function()
				vim.lsp.buf_request(orig_buf, "textDocument/hover", params, function(err, res)
					hover_set_contents(orig_buf, params, popup_buf, popup_win, res)
				end)
			end)
		end)
	elseif params.verbosityLevel > 1 then
		del_keys({ "+", "<kPlus>" }, popup_buf)
	end
	if #plusMinusOpts > 0 then
		table.insert(contents, 1, "----" .. plusMinusOpts .. "----")
	end
	vim.api.nvim_win_set_height(popup_win, math.min(#contents, vim.o.lines - 3))
	vim.api.nvim_buf_set_lines(popup_buf, 0, -1, false, contents)
end

vim.keymap.set("n", "K", function()
	local params = vim.lsp.util.make_position_params()
	params.verbosityLevel = 0
	vim.lsp.buf_request(0, "textDocument/hover", params, function(err, res)
		if res == nil then
			-- happens for instance when triggering hover on a plain string
			return
		end
		local orig_buf = vim.api.nvim_win_get_buf(0)

		local popup_buf = vim.api.nvim_create_buf(false, true)
		vim.bo[popup_buf].filetype = "markdown"

		local width = 70
		local height = 15
		local win_opts = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			relative = "cursor",
			width = width,
			height = height,
			anchor = "NW",
			row = 2,
			col = 30,
			noautocmd = true,
		}
		local popup_win = vim.api.nvim_open_win(popup_buf, true, win_opts)
		vim.api.nvim_set_option_value("conceallevel", 2, { win = popup_win })

		hover_set_contents(orig_buf, params, popup_buf, popup_win, res)

		vim.keymap.set("n", "q", function()
			vim.api.nvim_win_close(popup_win, true)
			vim.api.nvim_buf_delete(popup_buf, { force = true })
		end, { buffer = popup_buf })
	end)
end, { buffer = true })
