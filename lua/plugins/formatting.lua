return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          css = { { "prettied", "prettier" } },
          graphql = { { "prettied", "prettier" } },
          html = { { "prettied", "prettier" } },
          javascript = { { "prettied", "prettier" } },
          javascriptreact = { { "prettied", "prettier" } },
          json = { { "prettied", "prettier" } },
          lua = { "stylua" },
          markdown = { { "prettied", "prettier" } },
          python = { "isort", "black" },
          sql = { "sql-formatter" },
          svelte = { { "prettied", "prettier" } },
          typescript = { { "prettied", "prettier", "sql-formatter" } },
          typescriptreact = { { "prettied", "prettier" } },
          yaml = { "prettier" },
          xml = { "xmlformatter" }
        },
      })

      vim.keymap.set({ "n" }, "<leader>f", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "format file" })

      vim.keymap.set({ "v" }, "<leader>f", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "format selection" })

      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end

        conform.format({ async = true, lsp_fallback = true, range = range })
      end, { range = true })
    end,
  },
}
