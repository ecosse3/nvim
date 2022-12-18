local nvm_alias_for_nvim = "nvim-node"
local nvim_npm_folder = vim.fn.expand("$HOME/.config/nvim-npm")
local stdpath = vim.fn.stdpath
local uv = vim.loop
local table_unpack = table.unpack == nil and unpack or table.unpack
local M = {}


-- Some path utilities
M.path = (function()
	local is_windows = uv.os_uname().version:match 'Windows'

	local function escape_wildcards(path)
		return path:gsub('([%[%]%?%*])', '\\%1')
	end

	local function sanitize(path)
		if is_windows then
			path = path:sub(1, 1):upper() .. path:sub(2)
			path = path:gsub('\\', '/')
		end
		return path
	end

	local function exists(filename)
		local stat = uv.fs_stat(filename)
		return stat and stat.type or false
	end

	local function is_dir(filename)
		return exists(filename) == 'directory'
	end

	local function is_file(filename)
		return exists(filename) == 'file'
	end

	local function is_fs_root(path)
		if is_windows then
			return path:match '^%a:$'
		else
			return path == '/'
		end
	end

	local function is_absolute(filename)
		if is_windows then
			return filename:match '^%a:' or filename:match '^\\\\'
		else
			return filename:match '^/'
		end
	end

	local function dirname(path)
		local strip_dir_pat = '/([^/]+)$'
		local strip_sep_pat = '/$'
		if not path or #path == 0 then
			return
		end
		local result = path:gsub(strip_sep_pat, ''):gsub(strip_dir_pat, '')
		if #result == 0 then
			if is_windows then
				return path:sub(1, 2):upper()
			else
				return '/'
			end
		end
		return result
	end

	local function path_join(...)
		return table.concat(vim.tbl_flatten { ... }, '/')
	end

	-- Traverse the path calling cb along the way.
	local function traverse_parents(path, cb)
		path = uv.fs_realpath(path)
		local dir = path
		-- Just in case our algo is buggy, don't infinite loop.
		for _ = 1, 100 do
			dir = dirname(dir)
			if not dir then
				return
			end
			-- If we can't ascend further, then stop looking.
			if cb(dir, path) then
				return dir, path
			end
			if is_fs_root(dir) then
				break
			end
		end
	end

	-- Iterate the path until we find the rootdir.
	local function iterate_parents(path)
		local function it(_, v)
			if v and not is_fs_root(v) then
				v = dirname(v)
			else
				return
			end
			if v and uv.fs_realpath(v) then
				return v, path
			else
				return
			end
		end

		return it, path, path
	end

	local function search_ancestors(startpath, func)
		vim.validate { func = { func, 'f' } }
		if func(startpath) then
			return startpath
		end
		local guard = 100
		for path in iterate_parents(startpath) do
			-- Prevent infinite recursion if our algorithm breaks
			guard = guard - 1
			if guard == 0 then
				return
			end

			if func(path) then
				return path
			end
		end
	end

	local function is_descendant(root, path)
		if not path then
			return false
		end

		local function cb(dir, _)
			return dir == root
		end

		local dir, _ = traverse_parents(path, cb)

		return dir == root
	end

	local path_separator = is_windows and ';' or ':'

	return {
		escape_wildcards = escape_wildcards,
		is_dir = is_dir,
		is_file = is_file,
		is_absolute = is_absolute,
		exists = exists,
		dirname = dirname,
		join = path_join,
		sanitize = sanitize,
		traverse_parents = traverse_parents,
		iterate_parents = iterate_parents,
		is_descendant = is_descendant,
		path_separator = path_separator,
		search_ancestors = search_ancestors,
	}
end)()


M.resolve_path_in_nvim_npm_folder = function(...)
	if select("#", ...) <= 0 then
		error("path segments is required")
	end
	return M.path.join(nvim_npm_folder, ...)
end
M.nvim_npm_bin_prefix = function(bin_name)
	return M.resolve_path_in_nvim_npm_folder("bin", bin_name)
end

M.get_nvm_node_path = function()
	local ok, md = pcall(require, "nvm_node_path_generated")
	if ok then
		return md.node_bin_path
	end
	return nil
end

M.compile_nvm_node_path = function()
	local output_path = M.path.join(stdpath("config"), "lua", "nvm_node_path_generated.lua")
	local nvm_dir = os.getenv("NVM_DIR")
	if not nvm_dir then
		-- emit warning?
		return
	end

	local node_version = nil
	if pcall(function() io.input(M.path.join(nvm_dir, "alias", nvm_alias_for_nvim)) end) then
		node_version = io.read()
		io.close()
	end

	if not node_version then
		return
	end

	local node_bin_path = M.path.join(nvm_dir, "versions", "node", node_version, "bin", "node")
	local output_file = io.open(output_path, 'w')
	if not output_file then
		return
	end
	output_file:write(string.format([[
		local M = {}
		M.node_bin_path = %q
		return M
	]], node_bin_path))
	output_file:close()
	return node_bin_path
end

M.get_nvim_node_cmd = function(cmd_name, ...)
	local bin_full_name = M.nvim_npm_bin_prefix(cmd_name)
	local node_path = M.get_nvm_node_path()
	if not node_path then
		return { bin_full_name, ... }
	else
		return { node_path, bin_full_name, ... }
	end
end

M.resolve_path_in_node_modules = function(root_dir, path_segs)
	if path_segs == nil or #path_segs <= 0 then
		error("path segments is required")
	end


	local found_ts = nil
	local function check_dir(path)
		found_ts = M.path.join(path, table_unpack(path_segs))
		if M.path.exists(found_ts) then
			return found_ts
		end
	end

	if M.path.search_ancestors(root_dir, check_dir) then
		return found_ts
	end
	return nil
end

M.get_mason_node_cmd = function(cmd_name, ...)
	local bin_full_name = require("mason-core.path").bin_prefix(cmd_name)
	local node_path = M.get_nvm_node_path()
	if not node_path then
		-- defaults
		return { bin_full_name, ... }
	else
		return { node_path, bin_full_name, ... }
	end
end

M.get_typescript_server_path = function(root_dir)
	local global_ts = M.resolve_path_in_nvim_npm_folder("lib/node_modules/typescript/lib")

	local found_ts = M.resolve_path_in_node_modules(root_dir, { 'node_modules', 'typescript', 'lib' })

	return found_ts or global_ts
end

return M
