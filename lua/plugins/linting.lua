return {
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")

      local default_linters = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        python = { "pylint" },
        dockerfile = { "hadolint" },
        terraform = { "tflint" },
        hcl = { "tflint" },
      }
      
      -- Merge with user custom linters
      lint.linters_by_ft = vim.tbl_deep_extend("force", default_linters, EcoVim.linters or {})

      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "lint file" })
    end,
  },
}
