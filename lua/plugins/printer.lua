return {
  {
    "rareitems/printer.nvim",
    event = "BufEnter",
    ft = {
      "lua",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    opts = {
      keymap = "gp",             -- Plugin doesn't have any keymaps by default
      behavior = "yank", -- how operator should behave
      -- "insert_below" will insert the text below the cursor
      --  "yank" will not insert but instead put text into the default '"' register
      formatters = {
        -- you can define your formatters for specific filetypes
        -- by assigning function that takes two strings
        -- one text modified by 'add_to_inside' function
        -- second the variable (thing) you want to print out
        -- see examples in lua/formatters.lua
        lua = function(inside, variable)
          return string.format('print("%s: " .. %s)', inside, variable)
        end,
        typescriptreact = function(inside, variable)
          return string.format("console.log('%s: ', %s);", inside, variable)
        end,
      },
      -- function which modifies the text inside string in the print statement, by default it adds the path and line number
      add_to_inside = function(text)
        return string.format("[%s:%s] %s", vim.fn.expand("%:h"):gsub(GIT_CWD(), ''), vim.fn.line("."), text)
      end,
      -- set to to indenity function to turn off the default behaviour
      -- add_to_inside = function(text)
      --     return text
      -- end,
    },
    keys = {
      -- You can use use '<Plug>printer_print' to call the pluging inside more advanced keymaps
      -- for example a keymap that always adds a prnt statement based on 'iw'
      "n", "gP", "<Plug>(printer_print)iw"
    }
  },
}
