return {
  { "dhruvasagar/vim-table-mode", ft = { "markdown" } },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "Avante", "copilot-chat", "codecompanion" },
    opts = {
      render_modes = true,
      file_types = { "markdown", "Avante", "copilot-chat", "codecompanion" },
      sign = {
        enabled = false,
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && pnpm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }, }
