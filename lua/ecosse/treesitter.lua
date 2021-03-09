require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>gn",
      node_incremental = "<leader>gr",
      scope_incremental = "<leader>gc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true
  },
}
