-- ╭──────────────────────────────────────────────────────────╮
-- │ This is a custom telescope ripgrep picker that           │
-- │  accepts predefined shortcuts after two spaces in input. │
-- │                                                          │
-- │ Those shortcuts will filter files by selected            │
-- │  extension only.                                         │
-- │                                                          │
-- │ Default keybinding is <S-P>                              │
-- ╰──────────────────────────────────────────────────────────╯

local conf = require("telescope.config").values
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local pickers = require "telescope.pickers"

local flatten = vim.tbl_flatten

local function is_table(t) return type(t) == 'table' end
local function is_string(t) return type(t) == 'string' end

return function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
  opts.shortcuts = opts.shortcuts
      or {
        ["c"] = "*.c",
        ["js"] = "*.{js,jsx}",
        ["json"] = "*.json",
        ["l"] = "*.lua",
        ["lua"] = "*.lua",
        ["md"] = "*.md",
        ["styles"] = "{styles.tsx,styles.ts,styles.js,*.styles.tsx,*.styles.ts,*.styles.js}",
        ["stories"] = "{stories.tsx,stories.ts,stories.js,*.stories.tsx,*.stories.ts,*.stories.js}",
        ["test"] = "*{.test.tsx,.test.ts,.test.js,-test.tsx,-test.ts,-test.js}",
        ["tests"] = "*{.test.tsx,.test.ts,.test.js,-test.tsx,-test.ts,-test.js}",
        ["ts"] = {
          "*.{ts,tsx}",
          "!*{.test.tsx,.test.ts,.test.js,-test.tsx,-test.ts,-test.js}"
        },
        ["tsx"] = {
          "*.tsx",
          "!*{.test.tsx,.test.ts,.test.js,-test.tsx,-test.ts,-test.js}"
        },
        ["xml"] = "*.xml",
      }
  opts.pattern = opts.pattern or "%s"

  local custom_grep = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local prompt_split = vim.split(prompt, "  ")

      local args = { "rg" }
      if prompt_split[1] then
        table.insert(args, "-e")
        table.insert(args, prompt_split[1])
      end

      if prompt_split[2] and is_table(opts.shortcuts[prompt_split[2]]) then
        local pattern

        for _, value in pairs(opts.shortcuts[prompt_split[2]]) do
          table.insert(args, "-g")
          if opts.shortcuts[prompt_split[2]] then
            pattern = value
          else
            pattern = prompt_split[2]
          end

          table.insert(args, string.format(opts.pattern, pattern))
        end
      end

      if prompt_split[2] and is_string(opts.shortcuts[prompt_split[2]]) then
        table.insert(args, "-g")

        local pattern
        if opts.shortcuts[prompt_split[2]] then
          pattern = opts.shortcuts[prompt_split[2]]
        else
          pattern = prompt_split[2]
        end

        table.insert(args, string.format(opts.pattern, pattern))
      end

      return flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Live Grep (with shortcuts)",
    finder = custom_grep,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end
